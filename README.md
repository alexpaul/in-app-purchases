# StoreKit

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

## Types of In-App Purchases

![Screen Shot 2023-03-28 at 6 24 55 PM](https://user-images.githubusercontent.com/1819208/228380295-fedcae7c-4250-4277-b533-244c19c97738.png)

* Consumable: A product that is used once, after which it becomes depleted and must be purchased again. Example: Fish food for a fishing app.
* Non-Consumable: A product that is purchased once and does not expire or decrease with use. Example: Race track for a game app.
* Auto-Renewable Subscription: A product that allows users to purchase dynamic content for a set period. This type of subscription renews automatically unless cancelled by the user. Example: Monthly subscription for an app offering a streaming service.
* Non-Renewing Subscription: A product that allows users to purchase a service with a limited duration. The content of this in-app purchase can be static. This type of subscription does not renew automatically. Example: One-year subscription to a catalog of archived articles.

[Read more](https://developer.apple.com/in-app-purchase/)

## Product Identifiers and Products

* [Apple Docs: Loading In-App Product Identifiers](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/loading_in-app_product_identifiers)
* [Apple Docs: Fetching Product Information from the App Store](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/fetching_product_information_from_the_app_store)

## Project Demos 

* [My Repo: FakeGame demo app uses StoreKit to implement in-app purchases (StoreKit)](https://github.com/alexpaul/In-App-Purchases/tree/main/FakeGame)
* [Apple: Demo app Implementing a Store In Your App Using the StoreKit API (StoreKit 2)](https://developer.apple.com/documentation/storekit/in-app_purchase/implementing_a_store_in_your_app_using_the_storekit_api)

## WWDC Playlist

* [WWDC 2017: What's New in StoreKit](https://devstreaming-cdn.apple.com/videos/wwdc/2017/303f0u5froddl13/303/303_hd_whats_new_in_storekit.mp4?dl=1)
* [WWDC 2017: Advanced StoreKit](https://devstreaming-cdn.apple.com/videos/wwdc/2017/305k3ed4sd37at/305/305_hd_advanced_storekit.mp4?dl=1)
* [WWDC 2018: Best Practices and What’s New with In-App Purchases](https://developer.apple.com/videos/play/wwdc2018/704/)
* [WWDC 2018: Engineering Subscriptions](https://developer.apple.com/videos/play/wwdc2018/705/)
* [WWDC 2019: In-App Purchases and Using Server-to-Server Notifications](https://developer.apple.com/videos/play/wwdc2019/302/)
* [WWDC 2019: Subscription Offers Best Practices](https://developer.apple.com/videos/play/wwdc2019/305/)
* [WWDC 2020: Architecting for subscriptions](https://developer.apple.com/videos/play/wwdc2020/10671/)
* [WWDC 2020: What’s new with in-app purchase](https://developer.apple.com/videos/play/wwdc2020/10661/)
* [WWDC 2020: Introducing StoreKit Testing in Xcode](https://developer.apple.com/videos/play/wwdc2020/10659/)
* [WWDC 2021: Meet StoreKit 2](https://developer.apple.com/videos/play/wwdc2021/10114/)
* [WWDC 2021: Manage in-app purchases on your server](https://developer.apple.com/videos/play/wwdc2021/10174/)
* [WWDC 2021: Support customers and handle refunds](https://developer.apple.com/videos/play/wwdc2021/10175/)

## Other Resources 

* [Apple Docs: Validating Receipts with the App Store](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/validating_receipts_with_the_app_store)
* [Apple Store Connect: Workflow for configuring in-app purchases](https://help.apple.com/app-store-connect/#/devb57be10e7)

## Troubleshooting 

* [Troubleshooing Invalid Product Ids](https://developer.apple.com/library/archive/technotes/tn2413/_index.html#//apple_ref/doc/uid/DTS40016228-CH1-TROUBLESHOOTING-WHY_ARE_MY_PRODUCT_IDENTIFIERS_BEING_RETURNED_IN_THE_INVALIDPRODUCTIDENTIFIERS_ARRAY_)

