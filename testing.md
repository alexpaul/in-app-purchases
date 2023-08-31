# Testing In-App Purchases

## Contents 

1. [Introduction](#introduction)
2. [Testing international currencies](#testing-international-currencies)
3. [StoreKit Testing in Xcode](#storekit-testing-in-xcode)
4. [Sync a StoreKit Configuration file with App Store Connect](#sync-a-storekit-configuration-file-with-app-store-connect)
5. [Clear Sandbox Purchases](#clear-sandbox-purchases)
6. [Resources](#resources)

## Introduction

> There are 3 distinct testing environments: Production (App Store), TestFlight (Production Sandbox), and Sandbox (Developer Builds). Each behaves slightly differently and needs to be tested independently.

> StoreKit testing in Xcode is a local test environment where you can test in-app purchases without connecting to App Store servers. Set up in-app purchases in a StoreKit configuration file then add it to your Xcode project. After you enable the configuration file, the test environment uses this local data when your app calls StoreKit APIs.

![Screen Shot 2022-04-12 at 9 49 37 PM](https://user-images.githubusercontent.com/1819208/163083557-0662d0c6-9855-4399-ab4c-ca6e712f5a18.png)

* [Apple docs: Configure and test in-app purchases](https://help.apple.com/app-store-connect/#/dev7e89e149d)
* [RevenueCat](https://www.revenuecat.com/blog/engineering/the-ultimate-guide-to-subscription-testing-on-ios/)

***

## Testing international currencies 

* Create a Sandbox account and select the Region you're interested in e.g. India.
* Navigate to your UI showing the Store Products. 
* You should now observe that the Product's currency is local to that of the Sandbox account.

***

## StoreKit Testing in Xcode 

Some benefits: 
* Creating a local StoreKit Configuration file in Xcode.
  * The Products in the local config file can be distinct from those on App Store Connect.
* Syncing a StoreKit Configuration file with App Store Connect.
  * After syncing the StorKit Configuration file with App Store Connect you will have access to the ASC Products and Subscriptions.
  * This feature was introduced in Xcode 14. 
* The ability to test purchasing in the simulator or device without needing a Sandbox account.
* Manage StoreKit transactions via the Debug menu bar.

***

## Sync a StoreKit Configuration file with App Store Connect

> By syncing the StoreKit Config file you will have full access to testing the Products and Subscriptons on App Store Connect.

* In Xcode navigate to File >> New >> File. 
* Search for "StoreKit", the view should now be filtered with the "StoreKit Configuration File" option. 
* Select "StoreKit Configuration File" and toggle on the "Sync this file with an app in App Store Connect" option. 
* After Xcode determines your Apple Account credentials for your "Team" and "App" you can select "Next".
* At this point you will now have access to a StoreKit Configuration file that is synced with App Store Connect.
* In this StoreKit Config file you will have access to all the Products and Subscriptions from App Store Connect for testing. 
* Note: The Products and Subscription are read-only. To make changes to the StoreKit Config file you have to update App Store Connect and sync the Config file in Xcode.

To modify a synced StoreKit configuration file you need to convert it into a local StoreKit configuration: 
* Select the synced StoreKit file.
* Navigate to the Xcode menu -> Editor and select "Convert to Local StoreKit Configuration".
* A prompt will display that this file will no longer be able to be synced.

![convert-to-local-storekit](https://github.com/alexpaul/in-app-purchases/assets/1819208/b9c2f5c5-4de5-4f4b-aadf-e694995a93dc)

Troubleshooting:  
* Too many requests (429) when attempting to sync with App Store Connect.
* Resolution: Unfortunately here we will have to create a local StoreKit file.
![Screenshot 2023-08-31 at 12 09 08 PM](https://github.com/alexpaul/in-app-purchases/assets/1819208/edfe305e-8088-4a1b-87b2-6dad3af4d89a)

Resources  
[What's new in StoreKit testing - WWDC22](https://developer.apple.com/videos/play/wwdc2022/10039/)

## Clear Sandbox Purchases 

* Log in [developer.apple/account.com](https://developer.apple.com/account)
* Click on [Users and Access](https://appstoreconnect.apple.com/access/users)
* Click on [Sandbox Tester](https://appstoreconnect.apple.com/access/users/sandbox)
* Click on "Edit" and select the Sandbox accounts you want to clear.

### Clear Purchase History
![clear-purchase-history](https://github.com/alexpaul/in-app-purchases/assets/1819208/33b146c4-0c23-44f1-b886-ee9c8ce6bc9d)

### Confirmation Dialog
![confirmation](https://github.com/alexpaul/in-app-purchases/assets/1819208/3a278db9-7fe2-498b-bd49-eb5fc73a2f24)

## Resources

* [Apple docs: Testing In-App Purchases with Sandbox
](https://developer.apple.com/documentation/storekit/in-app_purchase/testing_in-app_purchases_with_sandbox)
* [NEW Apple docs: Test in-app purchases](https://developer.apple.com/help/app-store-connect/test-in-app-purchases-main/test-in-app-purchases)
* [Apple docs: Setting Up StoreKit Testing in Xcode](https://developer.apple.com/documentation/xcode/setting-up-storekit-testing-in-xcode)
* [RevenueCat: The Ultimate Guide to iOS Subscription Testing](https://www.revenuecat.com/blog/the-ultimate-guide-to-subscription-testing-on-ios#sandbox) ⭐️
* [Apple docs: Testing an Auto-Renewable Subscription](https://developer.apple.com/documentation/storekit/in-app_purchase/testing_in-app_purchases_with_sandbox/testing_an_auto-renewable_subscription)
* [What's new in StoreKit testing - WWDC22](https://developer.apple.com/videos/play/wwdc2022/10039/)

