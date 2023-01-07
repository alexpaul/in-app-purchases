# App Store Receipts

## Receipt Validation in iOS 7+

> [RevernueCat](https://www.revenuecat.com/blog/app-store-receipt-file-example/): Starting with iOS 7, Apple introduced an alternative method for accessing a user’s IAP history. Previously developers had to rely on the SKPaymentQueue as the source of truth, listening to transactions and keeping track. With iOS 7, Apple introduced NSBundle.appStoreReceiptURL that gave developers a disk location they could find this new “receipt” file. The intention was to have developers use this file as the source of truth for IAPs, rather than the StoreKit purchase queue which can be difficult to build around.

## Resources

* [Apple Docs: Validating Receipts with the App Store](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/validating_receipts_with_the_app_store)
* [Upcoming changes to the App Store receipt signing certificate](https://developer.apple.com/news/?id=ytb7qj0x&utm_campaign=iOS%2BDev%2BWeekly&utm_medium=email&utm_source=iOS%2BDev%2BWeekly%2BIssue%2B591)
