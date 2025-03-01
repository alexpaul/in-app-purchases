# Subscription Status 

Ways of checking if a user is entitled to an auto-renewable subscription. 
* `Product.SubscriptionInfo.Status`
* `Transaction.currentEntitlements`

## `Product.SubscriptionInfo.Status`

> [Apple](https://developer.apple.com/documentation/storekit/product/subscriptioninfo/status-swift.struct): The subscription status provides renewal information signed by the App Store for subscriptions that a customer purchases.

This method provides insightes like: 
* `subscribed`
* `inGracePeriod`, and
* `expired`

***

## `Transaction.currentEntitlements`

> [Apple](https://developer.apple.com/documentation/storekit/transaction/currententitlements): A sequence of the latest transactions that entitle a customer to In-App Purchases and subscriptions.

```swift
func refreshPurchasedProducts() async {
    // Iterate through the user's purchased products.
    for await verificationResult in Transaction.currentEntitlements {
        switch verificationResult {
        case .verified(let transaction):
            // Check the type of product for the transaction
            // and provide access to the content as appropriate.
            ...
        case .unverified(let unverifiedTransaction, let verificationError):
            // Handle unverified transactions based on your
            // business model.
            ...
        }
    }
}
```
***

## Resources 

* [`Product.SubscriptionInfo.Status`](https://developer.apple.com/documentation/storekit/product/subscriptioninfo/status-swift.struct)
* [`currentEntitlements`](https://developer.apple.com/documentation/storekit/transaction/currententitlements)
