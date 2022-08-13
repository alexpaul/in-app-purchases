# Introductory Offers 

> [Apple Docs](https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase/subscriptions_and_offers/implementing_introductory_offers_in_your_app): Apps with auto-renewable subscriptions can offer a discounted introductory price, including a free trial, to eligible users. You can make introductory offers to customers who haven’t previously received an introductory offer for the given product, or for any products in the same subscription group.

> Start by setting up introductory offers in App Store Connect. Then, in your app, determine if the user is eligible to receive an introductory offer. When the app queries the App Store for a list of available products, display the introductory pricing if the user is eligible to receive them.

## Testing Eligible and InEligible Users for Introductory Offers

1. A fresh used Sandbox Test user will be eligible for Introductory Offers.
2. You can also via the App Store Manage screen put a user back in an "Eligible" state by clicking on "Reset Eligibility" if that user previously used an Introductory Offer.
3. To test ineligible users, allow the Sandbox user's subscription to expire, typically 20 to 30 minutes, this can also be adjusted via App Store Connect. 
4. Once the subscription has been expired, navigate to iOS Settings > App Store > Sandbox Account. 
5. Click on "Manage" from the "Sandbox Apple ID" alert and resubscribe to the same Product or a Product from the same Subscription Group.
6. At this time the logged Sandbox user will not be eligible for Introductory Pricing. Yikes! 😱 A bit of moving around here, but now you should no longer be eligible. 

## Resources 

* [WWDC 2018: Best Practices and What’s New with In-App Purchases](https://developer.apple.com/videos/play/wwdc2018/704/)
* [Apple docs: Implementing Introductory Offers In Your App](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/subscriptions_and_offers/implementing_introductory_offers_in_your_app)
* [Apple docs: Testing Introductory Offers](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/subscriptions_and_offers/testing_introductory_offers)
* [Ray Wenderlich: Introductory Pricing for iOS: Getting Started](https://www.raywenderlich.com/9307-introductory-pricing-for-ios-getting-started)
* [RevenueCat: A Guide to iOS Introductory Prices](https://www.revenuecat.com/blog/ios-introductory-prices/)
