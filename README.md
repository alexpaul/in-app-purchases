# StoreKit

## Glossary 

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

## Types of In-App Purchases

* Consumable: A product that is used once, after which it becomes depleted and must be purchased again. Example: Fish food for a fishing app.
* Non-Consumable: A product that is purchased once and does not expire or decrease with use. Example: Race track for a game app.
* Auto-Renewable Subscription: A product that allows users to purchase dynamic content for a set period. This type of subscription renews automatically unless cancelled by the user. Example: Monthly subscription for an app offering a streaming service.
* Non-Renewing Subscription: A product that allows users to purchase a service with a limited duration. The content of this in-app purchase can be static. This type of subscription does not renew automatically. Example: One-year subscription to a catalog of archived articles.

## Product Identifiers and Products

* [Apple Docs: Loading In-App Product Identifiers](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/loading_in-app_product_identifiers)
* [Apple Docs: Fetching Product Information from the App Store](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/fetching_product_information_from_the_app_store)

## Resources

* [FakeGame demo app uses StoreKit to implement in-app purchases](https://github.com/alexpaul/In-App-Purchases/tree/main/FakeGame)
* [Validating Receipts with the App Store](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/validating_receipts_with_the_app_store)
* [Workflow for configuring in-app purchases](https://help.apple.com/app-store-connect/#/devb57be10e7)
* [Demo app Implementing a Store In Your App Using the StoreKit API](https://developer.apple.com/documentation/storekit/in-app_purchase/implementing_a_store_in_your_app_using_the_storekit_api)
