#  Implementing and testing offer codes 

## About offer codes 

* You can create codes for a maximum of 1,000,000 redemptions per app, per quarter.
* There are two types of offer codes:
  * One-time use codes.
    * Created and downloadable from App Store Connect.
    * One-time codes are redeemable through a redemption URL.
  * Custom codes.
    * Can also be redeemed through a redemption URL.
    * Reusable codes that can be used in campaigns e.g. "SPRINGSALE2024".
    * Can be entered from a flyer or similar marketing campaign using the custom code.
    * As per Apple ideal for large campaigns that require mass distribution.

## Configuring offer codes 

* A required in-app purchase subscription should exist or need to be created.
* Select the subscription product. 
* Navigate to "Offer Codes" in App Store Connect.
* Proceed to create the offer code.
    
## Redemption Flow 

* Both offer codes can be redeemed via a redemption URL that links to the App Store or deep links to your app. 
* Apple recommends custom codes for large-scale campaigns. 
* Once the user clicks on the redemption URL one of the following scenarios will happen: 
  * The user is navigated to the App Store if the app is not installed on their device.
  * The user is navigated to the redemption sheet in-app if the app is present.

## Using StoreKit testing ✅

* Create a local StoreKit configuration file.
* Or use a synced StoreKit configuration file from App Store Connect.

https://github.com/alexpaul/in-app-purchases/assets/1819208/27826489-8665-47f3-b19d-4075b89cf480

## Using Sandbox testing ❌

* Not currently available.

## Resources

* [Apple docs: Set up offer codes](https://developer.apple.com/help/app-store-connect/manage-subscriptions/set-up-offer-codes/)
* [Apple docs: Implementing offer codes in your app](https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase/subscriptions_and_offers/implementing_offer_codes_in_your_app)
* [Developer forum: sandbox not working for offer codes](https://developer.apple.com/forums/thread/688550)

