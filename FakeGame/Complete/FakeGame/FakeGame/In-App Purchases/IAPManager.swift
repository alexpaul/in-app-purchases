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

    var onReceiveProductsHandler: ((Result<[SKProduct], IAPManagerError>) -> Void)?

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
