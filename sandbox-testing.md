# Testing In-App Purchases

> There are 3 distinct testing environments: Production (App Store), TestFlight (Production Sandbox), and Sandbox (Developer Builds). Each behaves slightly differently and needs to be tested independently.

> StoreKit testing in Xcode is a local test environment where you can test in-app purchases without connecting to App Store servers. Set up in-app purchases in a StoreKit configuration file then add it to your Xcode project. After you enable the configuration file, the test environment uses this local data when your app calls StoreKit APIs.

## Resources

* [Apple docs: Testing In-App Purchases with Sandbox
](https://developer.apple.com/documentation/storekit/in-app_purchase/testing_in-app_purchases_with_sandbox)
* [Apple docs: Setting Up StoreKit Testing in Xcode](https://developer.apple.com/documentation/xcode/setting-up-storekit-testing-in-xcode)
* [RevenueCat: The Ultimate Guide to iOS Subscription Testing](https://www.revenuecat.com/blog/the-ultimate-guide-to-subscription-testing-on-ios#sandbox)
* [Apple docs: Testing an Auto-Renewable Subscription](https://developer.apple.com/documentation/storekit/in-app_purchase/testing_in-app_purchases_with_sandbox/testing_an_auto-renewable_subscription)
