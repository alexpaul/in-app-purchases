# Introductory Offers 

> Apps with auto-renewable subscriptions can offer a discounted introductory price, including a free trial, to eligible users. You can make introductory offers to customers who haven’t previously received an introductory offer for the given product, or for any products in the same subscription group.

> Start by setting up introductory offers in App Store Connect. Then, in your app, determine if the user is eligible to receive an introductory offer. When the app queries the App Store for a list of available products, display the introductory pricing if the user is eligible to receive them.

## Testing Eligible and InEligible Users for Introductory Rate

1. A fresh used Sandbox user will be eligible for introductory offers.
2. To test ineligible users, allow the Sandbox user's subscription to expire, typically 20 to 30 minutes. 
3. Once the subscripiton has been expired, navigate to Settings > App Store > Sandbox Account. 
4. Click on "Manage" from the "Sandbox Apple ID" alert and resubscribe to the same Product or a Product from the Subscription Group.
5. At this time the logged Sandbox user will not be eligible for Introductory Pricing. Yikes! A bit of moving around here. 

## Resources 

* [Apple docs: Implementing Introductory Offers In Your App](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/subscriptions_and_offers/implementing_introductory_offers_in_your_app)
* [Apple docs: Testing Introductory Offers](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/subscriptions_and_offers/testing_introductory_offers)
* [Ray Wenderlich: Introductory Pricing for iOS: Getting Started](https://www.raywenderlich.com/9307-introductory-pricing-for-ios-getting-started)
