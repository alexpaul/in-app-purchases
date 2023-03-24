# Introductory Offers 

> [Apple Docs](https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase/subscriptions_and_offers/implementing_introductory_offers_in_your_app): Apps with auto-renewable subscriptions can offer a discounted introductory price, including a free trial, to eligible users. You can make introductory offers to customers who haven’t previously received an introductory offer for the given product, or for any products in the same subscription group.

> Start by setting up introductory offers in App Store Connect. Then, in your app, determine if the user is eligible to receive an introductory offer. When the app queries the App Store for a list of available products, display the introductory pricing if the user is eligible to receive them.

***

## Testing Eligible and InEligible Users for Introductory Offers

1. A fresh used Sandbox Test user will be eligible for Introductory Offers.
2. You can also via the App Store Manage screen put a user back in an "Eligible" state by clicking on "Reset Eligibility" if that user previously used an Introductory Offer.
3. To test ineligible users, allow the Sandbox user's subscription to expire, typically 20 to 30 minutes, this can also be adjusted via App Store Connect. 
4. Once the subscription has been expired, navigate to iOS Settings > App Store > Sandbox Account. 
5. Click on "Manage" from the "Sandbox Apple ID" alert and resubscribe to the same Product or a Product from the same Subscription Group.
6. At this time the logged Sandbox user will not be eligible for Introductory Pricing. Yikes! 😱 A bit of moving around here, but now you should no longer be eligible. 

***

## Notes on Configuring Intro Pricing 

* Once the date of the Intro Pricing becomes current ONLY the end date can be modified.

***

## Setting up Intro Pricing 

![Screen Shot 2023-03-23 at 8 20 31 PM](https://user-images.githubusercontent.com/1819208/227392454-dd9089ed-cea4-4625-a6aa-faf86d7c3f6f.png)

![Screen Shot 2023-03-23 at 8 22 09 PM](https://user-images.githubusercontent.com/1819208/227392596-fa9eac8b-4a13-45e9-a326-d61e2380bc93.png)

![Screen Shot 2023-03-23 at 8 22 56 PM](https://user-images.githubusercontent.com/1819208/227392671-9622e5a2-6003-4c21-82ab-c24e1d0fc953.png)

![Screen Shot 2023-03-23 at 8 23 57 PM](https://user-images.githubusercontent.com/1819208/227392768-fec1f467-87f9-4fe9-85e6-f9e88ebd7805.png)

![Screen Shot 2023-03-23 at 8 24 44 PM](https://user-images.githubusercontent.com/1819208/227392854-b0e14177-4bc0-45a4-a15a-7504b328232a.png)

![Screen Shot 2023-03-23 at 8 25 10 PM](https://user-images.githubusercontent.com/1819208/227392890-bb67a359-91d2-4239-8e7f-5fcc92f80488.png)

![Screen Shot 2023-03-23 at 8 26 08 PM](https://user-images.githubusercontent.com/1819208/227393024-6d2a5e7f-b51d-407d-9c91-2becd73fda9e.png)

***

## Resources 

* [WWDC 2018: Best Practices and What’s New with In-App Purchases](https://developer.apple.com/videos/play/wwdc2018/704/)
* [Apple docs: Implementing Introductory Offers In Your App](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/subscriptions_and_offers/implementing_introductory_offers_in_your_app)
* [Apple docs: Testing Introductory Offers](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/subscriptions_and_offers/testing_introductory_offers)
* [Apple docs: Set up an introductory offer for an auto-renewable subscription](https://help.apple.com/app-store-connect/#/deve1d49254f)
* [Ray Wenderlich: Introductory Pricing for iOS: Getting Started](https://www.raywenderlich.com/9307-introductory-pricing-for-ios-getting-started)
* [RevenueCat: A Guide to iOS Introductory Prices](https://www.revenuecat.com/blog/ios-introductory-prices/)
