# Original API for In-App Purchase

> [Original API for in-app purchase](https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase) In-App Purchase allows you to offer users the opportunity to purchase in-app content and features. Customers can make the purchases within your app, or directly from the App Store. 

***

## Fetching Product Information from the App Store

> [Apple Docs](https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase/fetching_product_information_from_the_app_store)

```swift
// Keep a strong reference to the product request.
var request: SKProductsRequest!

func validate(productIdentifiers: [String]) {
     let productIdentifiers = Set(productIdentifiers)

     request = SKProductsRequest(productIdentifiers: productIdentifiers)
     request.delegate = self 
     request.start()
}

var products = [SKProduct]()
// Create the SKProductsRequestDelegate protocol method 
// to receive the array of products.
func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
    if !response.products.isEmpty {
       products = response.products
       // Implement your custom method here.
       displayStore(products)
    }

    for invalidIdentifier in response.invalidProductIdentifiers {
       // Handle any invalid product identifiers as appropriate.
    }
}
```

## Resources

* [Apple docs: Original API for In-App Purchase](https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase)
* [Handling errors: `SKError`](https://developer.apple.com/documentation/storekit/skerror/code)
  * e.g `paymentcancelled` Error code indicating that the user canceled a payment request.
* [Apple docs: `SKPaymentTransaction`](https://developer.apple.com/documentation/storekit/skpaymenttransaction)
