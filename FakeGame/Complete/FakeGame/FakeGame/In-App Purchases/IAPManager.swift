//
//  IAPManager.swift
//  FakeGame
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2019 Appcoda. All rights reserved.
//

import StoreKit

class IAPManager: NSObject {
    enum IAPManagerError: Error {
        case noProductIDsFound
        case noProductsFound
        case paymentWasCancelled
        case productRequestFailed
    }

    static let shared = IAPManager()

    private var onReceiveProductsHandler: ((Result<[SKProduct], IAPManagerError>) -> Void)?

    private var onBuyProductHandler: ((Result<Bool, Error>) -> Void)?

    private var totalRestoredPurchases = 0

    private override init() {
        super.init()
    }

    fileprivate func getProductIDs() -> [String]? {
        guard let url = Bundle.main.url(forResource: "IAP_ProductIDs", withExtension: "plist") else {
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let productIDs = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String] ?? []
            return productIDs
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    func getProducts(withHandler productsReceiveHandler: @escaping (Result<[SKProduct], IAPManagerError>) -> Void) {
        onReceiveProductsHandler = productsReceiveHandler

        guard let productIDs = getProductIDs() else {
            productsReceiveHandler(.failure(.noProductIDsFound))
            return
        }

        let request = SKProductsRequest(productIdentifiers: Set(productIDs))

        request.delegate = self

        // Sends the Request to the Apple AppStore
        request.start()
    }

    func getPriceFormatted(for product: SKProduct) -> String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = product.priceLocale

        return formatter.string(from: product.price)
    }

    func startObserving() {
        SKPaymentQueue.default().add(self)
    }

    func stopObserving() {
        SKPaymentQueue.default().remove(self)
    }

    func canMakePayments() -> Bool {
        SKPaymentQueue.canMakePayments()
    }

    func purchase(product: SKProduct, withHandler handler: @escaping (Result<Bool, Error>) -> Void) {
        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(payment)

        onBuyProductHandler = handler
    }

    func restorePurchases(withHandler handler: @escaping ((_ result: Result<Bool, Error>) -> Void)) {
        onBuyProductHandler = handler
        totalRestoredPurchases = 0
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}

extension IAPManager.IAPManagerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noProductIDsFound: return "No In-App Purchase product identifiers were found."
        case .noProductsFound: return "No In-App Purchases were found."
        case .productRequestFailed: return "Unable to fetch available In-App Purchase products at the moment."
        case .paymentWasCancelled: return "In-App Purchase process was cancelled."
        }
    }
}

extension IAPManager: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let products = response.products

        if products.count > 0 {
            onReceiveProductsHandler?(.success(products))
        } else {
            onReceiveProductsHandler?(.failure(.noProductsFound))
        }
    }

    func request(_ request: SKRequest, didFailWithError error: Error) {
        onReceiveProductsHandler?(.failure(.productRequestFailed))
    }

    func requestDidFinish(_ request: SKRequest) {
        // code here if needed...
    }
}

extension IAPManager: SKPaymentTransactionObserver {
    // Observe transaction updates.
    // This method is called when the state of a transaction changes.
    func paymentQueue(_ queue: SKPaymentQueue,updatedTransactions transactions: [SKPaymentTransaction]) {
        //Handle transaction states here.

        transactions.forEach { transaction in
            switch transaction.transactionState {
            case .purchased:
                onBuyProductHandler?(.success(true))
                SKPaymentQueue.default().finishTransaction(transaction)
            case .restored:
                totalRestoredPurchases += 1
                SKPaymentQueue.default().finishTransaction(transaction)
            case .failed:
                if let error = transaction.error as? SKError {
                    if error.code != .paymentCancelled {
                        onBuyProductHandler?(.failure(error))
                    } else {
                        onBuyProductHandler?(.failure(IAPManagerError.paymentWasCancelled))
                    }
                    print("IAP Error: ", error.localizedDescription)
                }
            case .deferred, .purchasing:
                break
            @unknown default:
                break
            }
        }
    }

    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        if totalRestoredPurchases != 0 {
            onBuyProductHandler?(.success(true))
        } else {
            print("IAP: No purchases to restore!")
            onBuyProductHandler?(.success(false))
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        if let error = error as? SKError {
            if error.code != .paymentCancelled {
                print("IAP Restore Error:", error.localizedDescription)
                onBuyProductHandler?(.failure(error))
            } else {
                onBuyProductHandler?(.failure(IAPManagerError.paymentWasCancelled))
            }
        }
    }
}
