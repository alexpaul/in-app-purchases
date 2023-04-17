# Testing In-App Purchases

> There are 3 distinct testing environments: Production (App Store), TestFlight (Production Sandbox), and Sandbox (Developer Builds). Each behaves slightly differently and needs to be tested independently.

> StoreKit testing in Xcode is a local test environment where you can test in-app purchases without connecting to App Store servers. Set up in-app purchases in a StoreKit configuration file then add it to your Xcode project. After you enable the configuration file, the test environment uses this local data when your app calls StoreKit APIs.

![Screen Shot 2022-04-12 at 9 49 37 PM](https://user-images.githubusercontent.com/1819208/163083557-0662d0c6-9855-4399-ab4c-ca6e712f5a18.png)

* [Apple docs: Configure and test in-app purchases](https://help.apple.com/app-store-connect/#/dev7e89e149d)
* [RevenueCat](https://www.revenuecat.com/blog/engineering/the-ultimate-guide-to-subscription-testing-on-ios/)

***

## Testing international currencies 

* Create a Sandbox account and select the Region you're interested in e.g India.
* Navigate to your UI showing the Store Products. 
* You should now observe that the Product's currency is local to that of the Sandbox account.

***

## StoreKit Testing in Xcode 

Some benefits: 
* Creating a local StoreKit Configuration file in Xcode.
  * The Products in the local config file can be distinct from those on App Store Connect.
* Syncing a StoreKit Configuration file with App Store Connect.
  * After syncing the StorKit Configurgation file with App Store Connect you will have access to the ASC Products and Subscriptions.
  * This feature was introduced in Xcode 14. 
* The ability to test purchasing in the simulator or device without needing a Sandbox acccount.
* Manage StoreKit transactions via the Debug menu bar.

***

## Creating a StoreKit Configuration file in Xcode that's synced with App Store Connect

> By syncing the StoreKit Config file you will have full access to testing the Products and Subscriptons on App Store Connect.

* In Xcode navigate to File >> New >> File. 
* Search for "StoreKit", the view should now be filtered with the "StoreKit Configuration File" option. 
* Select "StoreKit Configuration File" and toggle on the "Sync this file with an app in App Store Connect" option. 
* After Xcode determines your Apple Account credentials for your "Team" and "App" you can select "Next".
* At this point you will now have access to a StoreKit Configuration file that is synced with App Store Connect.
* In this StoreKit Config file you will have access to all the Products and Subscriptions from App Store Connect for testing. 
* Note: The Products and Subscription are read only. To make changes to the StoreKit Config file you have to update App Store Connect and sync the Config file in Xcode.

[Resource](https://developer.apple.com/videos/play/wwdc2022/10039/)

## Resources

* [Apple docs: Testing In-App Purchases with Sandbox
](https://developer.apple.com/documentation/storekit/in-app_purchase/testing_in-app_purchases_with_sandbox)
* [NEW Apple docs: Test in-app purchases](https://developer.apple.com/help/app-store-connect/test-in-app-purchases-main/test-in-app-purchases)
* [Apple docs: Setting Up StoreKit Testing in Xcode](https://developer.apple.com/documentation/xcode/setting-up-storekit-testing-in-xcode)
* [RevenueCat: The Ultimate Guide to iOS Subscription Testing](https://www.revenuecat.com/blog/the-ultimate-guide-to-subscription-testing-on-ios#sandbox) ⭐️
* [Apple docs: Testing an Auto-Renewable Subscription](https://developer.apple.com/documentation/storekit/in-app_purchase/testing_in-app_purchases_with_sandbox/testing_an_auto-renewable_subscription)
* [What's new in StoreKit testing - WWDC22](https://developer.apple.com/videos/play/wwdc2022/10039/)

