## Glossary 

* [identifierForVendor](https://developer.apple.com/documentation/uikit/uidevice/1620059-identifierforvendor) An alphanumeric string that uniquely identifies a device to the app’s vendor.
* In-App Purchase: (Type, Reference Name, Product ID, Pricing, Display Name, Description, optional App Store Promotion).
* In-App Purchase Type: (Consumable, Non-Consumable, Auto-Renewable Subscription and Non-Renewing Subscription).
* StoreKit: Support in-app purchases and interactions with the App Store.
* SKProduct: Information about a product previously registered in App Store Connect. (...some props: productIdentifier, price, priceLocale, introductoryPrice, SKProductDiscount....).
* SKProductsRequest: An object that can retrieve localized information from the App Store about a specified list of products.
* SKProductsRequestDelegate: A set of methods the delegate implements so it receives the product information your app requests.
* SKPaymentQueue: A queue of payment transactions to be processed by the App Store.
* SKPaymentTransaction: An object in the payment queue.
* SKPaymentTransactionObserver: A set of methods that process transactions, unlock purchased functionality, and continue promoted in-app purchases.
* Sandbox Tester: Your development-signed apps use the sandbox environment when you sign in to the App Store using a Sandbox Apple ID. 

> To repeatedly test common in-app purchase scenarios for a sandbox tester, click Edit to clear their purchase history. [Learn More.](https://developer.apple.com/documentation/storekit/in-app_purchase/testing_in-app_purchases_with_sandbox)
