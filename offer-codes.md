#  Implementing and testing offer codes 

## About offer codes 

* You can create codes for a maximum of 1,000,000 redemptions per app, per quarter.
* Helps acquire, retain, and win back subscribers.
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
* Below in the screenshot and video we have an introductory offer, then the offer code, and finally the auto-renewable product.
 
![payment-sheet](https://github.com/alexpaul/in-app-purchases/assets/1819208/e11bbe76-718a-45c5-9115-4b3ce2a4eb08)

https://github.com/alexpaul/in-app-purchases/assets/1819208/27826489-8665-47f3-b19d-4075b89cf480

## Using Sandbox testing ❌

* Not currently supported.
* Cannot use App Store Connect offer codes to redeem in Sandbox. [See screenshot below].

![sandbox-testing-not-available](https://github.com/alexpaul/in-app-purchases/assets/1819208/cf0bd918-e5f0-4a13-827c-6666da2c44da)

## Presenting the redemption sheet in code 

```swift
import SwiftUI
import StoreKit


struct ContentView: View {
    @State private var redeemSheetIsPresented = false
    
    var body: some View {
        Button("Present offer code redemption sheet.") {
            redeemSheetIsPresented = true
        }
        .offerCodeRedemption(isPresented: $redeemSheetIsPresented) { result in
            // Handle result
        }
    }
}
```

[`offerCodeRedemption`](https://developer.apple.com/documentation/storekit/storeview/4203466-offercoderedemption)

## Resources

* [Apple docs: Set up offer codes](https://developer.apple.com/help/app-store-connect/manage-subscriptions/set-up-offer-codes/)
* [Apple docs: Implementing offer codes in your app](https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase/subscriptions_and_offers/implementing_offer_codes_in_your_app)
* [Apple tech talks: Get started with custom offer codes - 2022](https://developer.apple.com/videos/play/tech-talks/110150/)
* [Apple tech talks: Subscription offer codes - 2020](https://developer.apple.com/videos/play/tech-talks/10868/)
* [Developer forum: sandbox not working for offer codes](https://developer.apple.com/forums/thread/688550)

