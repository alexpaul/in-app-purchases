# Introductory Offers 

> [Apple Docs](https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase/subscriptions_and_offers/implementing_introductory_offers_in_your_app): Apps with auto-renewable subscriptions can offer a discounted introductory price, including a free trial, to eligible users. You can make introductory offers to customers who haven’t previously received an introductory offer for the given product, or for any products in the same subscription group.

> Start by setting up introductory offers in App Store Connect. Then, in your app, determine if the user is eligible to receive an introductory offer. When the app queries the App Store for a list of available products, display the introductory pricing if the user is eligible to receive them.

***

## Testing Introductory Pricing

1. Verify the Product being Purchased is associated with an Introductory Price. Refer to the [Apple documentation for Setting up Introductory Pricing on the Appple App Store Connect](https://help.apple.com/app-store-connect/#/deve1d49254f) or direct questions to [#gmax-public](https://nytimes.slack.com/app_redirect?channel=gmax-public).
2. Make sure you're using a fresh Apple Store Sandbox Account. If you have questions acquiring an Apple Sandbox account please contact [#gmax-public](https://nytimes.slack.com/app_redirect?channel=gmax-public). 
3. Install a fresh IAP Build (the build must support In-app Purchasing). In other words the build needs to allow subscription purchasing from the Bitrise build. 
4. When presented with the Product page for the app, e.g Newsreader, Cooking or Games, if the product is valid for Introductory Pricing a Strikethrough or similar UI should be visible to indicate the Product is available for Introductory Pricing. See Screenshot below.

![games-landing-page-intro-price](https://user-images.githubusercontent.com/1819208/191154299-900d2496-12f7-4ab0-b417-d31f00a13ff4.PNG)

5. Clicking on the Product and making the purchase should also indicate in the Apple presented Subscription UI that you are valid for Introductory Pricing. See screenshot below. 

![apple-sub-sheet-intro-pricing](https://user-images.githubusercontent.com/1819208/191154331-84d459d2-c871-4753-a90e-0250dafd046f.PNG)

#### Troubleshooting

* Via the Beta Settings of your app navigate to "Refresh Device Receipt". See screenshot. This will ensure that there is a valid receipt on your test device to be eligible for Intro Pricing. 
* Ensure that you have a fresh sandbox account. If in doubt reach out to the [#gmax-public](https://nytimes.slack.com/app_redirect?channel=gmax-public) team to get a new Sandbox account for testing.

***

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
* [Apple docs: Set up an introductory offer for an auto-renewable subscription](https://help.apple.com/app-store-connect/#/deve1d49254f)
* [Ray Wenderlich: Introductory Pricing for iOS: Getting Started](https://www.raywenderlich.com/9307-introductory-pricing-for-ios-getting-started)
* [RevenueCat: A Guide to iOS Introductory Prices](https://www.revenuecat.com/blog/ios-introductory-prices/)
