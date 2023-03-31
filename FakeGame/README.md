# FakeGame In-App Purchasing Demo

## Create In-App Purchases on AppStore Connect

![Screen Shot 2022-02-09 at 7 53 22 PM](https://user-images.githubusercontent.com/1819208/153316030-97968088-6dae-4fd1-9fc8-ca801cea37be.png)

## Added Product IDs to a `plist` in Xcode 

![Screen Shot 2022-02-09 at 7 58 34 PM](https://user-images.githubusercontent.com/1819208/153316481-0b81655a-71e0-48c0-b4e4-27696b5f341e.png)

## Sanbox Testers 

Create Sandbox Test account for testing purchasing.

## Key Files 

* [IAP_ProductIDs.plist](https://github.com/alexpaul/In-App-Purchases/blob/main/FakeGame/Complete/FakeGame/FakeGame/In-App%20Purchases/IAP_ProductIDs.plist)
* [IAPManager.swift](https://github.com/alexpaul/In-App-Purchases/blob/main/FakeGame/Complete/FakeGame/FakeGame/In-App%20Purchases/IAPManager.swift)
* [ViewModel.swift](https://github.com/alexpaul/In-App-Purchases/blob/main/FakeGame/Complete/FakeGame/FakeGame/View%20Model/ViewModel.swift)
* [ViewController.swift](https://github.com/alexpaul/In-App-Purchases/blob/main/FakeGame/Complete/FakeGame/FakeGame/View/ViewController.swift)

## Loading In-App Product Identifiers 

```swift
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
```

## Fetching Product Information from the App Store

```swift
// IAPManager.swift

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
```

```swift
// SKProductsRequestDelegate

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
```

## Resources 

* [AppCode - A Complete Guide to In-App Purchases for iOS Development](https://www.appcoda.com/in-app-purchases-guide/)
