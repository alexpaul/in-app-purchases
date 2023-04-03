# App Store Receipt

## Receipt Validation in iOS 7+

> [RevernueCat](https://www.revenuecat.com/blog/app-store-receipt-file-example/): Starting with iOS 7, Apple introduced an alternative method for accessing a user’s IAP history. Previously developers had to rely on the SKPaymentQueue as the source of truth, listening to transactions and keeping track. With iOS 7, Apple introduced NSBundle.appStoreReceiptURL that gave developers a disk location they could find this new “receipt” file. The intention was to have developers use this file as the source of truth for IAPs, rather than the StoreKit purchase queue which can be difficult to build around.

***

## Receipt 

> [`appStoreReceiptURL`](https://developer.apple.com/documentation/foundation/nsbundle/1407276-appstorereceipturl): The receipt isn’t necessary if you use `AppTransaction` to validate the app download, or `Transaction` to validate in-app purchases. Only use the receipt if your app uses the "Original API for in-app purchase", or needs the receipt to validate the app download because it can’t use `AppTransaction`.

***

## Receipt Fields

> Subscription Expiration Date. This key is only present for auto-renewable subscription receipts. Use this value to identify the date when the subscription will renew or expire, to determine if a customer should have access to content or service. After validating the latest receipt, if the subscription expiration date for the latest renewal transaction is a past date, it is safe to assume that the subscription has expired.

***

## Resources

* [Apple docs: App Store Receipts](https://developer.apple.com/documentation/appstorereceipts)
* [Apple docs: `appStoreReceiptURL`](https://developer.apple.com/documentation/foundation/nsbundle/1407276-appstorereceipturl)
* [Apple docs: Receipt Fields](https://developer.apple.com/library/archive/releasenotes/General/ValidateAppStoreReceipt/Chapters/ReceiptFields.html#//apple_ref/doc/uid/TP40010573-CH106-SW1)
* [Apple docs: Validating Receipts with the App Store](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/validating_receipts_with_the_app_store)
* [Apple docs: App Store Receipts Status Codes](https://developer.apple.com/documentation/appstorereceipts/status)
* [Apple docs: Upcoming changes to the App Store receipt signing certificate](https://developer.apple.com/news/?id=ytb7qj0x&utm_campaign=iOS%2BDev%2BWeekly&utm_medium=email&utm_source=iOS%2BDev%2BWeekly%2BIssue%2B591)
* [Apple docs: App Store receipt data types](https://developer.apple.com/documentation/appstorereceipts/app_store_receipt_data_types)
* [RevenueCat: App Store Receipt Validation](https://www.revenuecat.com/app-store-receipt-validation/)
