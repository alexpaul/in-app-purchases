# Introductory Offers 

👀 For new subscribers and lapsed subscribers who have not yet purchased a product associated with the intro offer or a product in the same subscription group. (Pay as you go, Pay up front or Free trial offers). 

## Contents 

1. [Testing Eligible and Ineligible Users for Introductory Offers](#testing-eligible-and-ineligible-users-for-introductory-offers)
2. [Notes on Configuring Intro Pricing](#notes-on-configuring-intro-pricing)
3. [Setting up Intro Pricing](#setting-up-intro-pricing)
4. [Fetching Intro Pricing](#fetching-intro-pricing)
5. [Determining if the user is eligible for Intro Pricing](#determining-if-the-user-is-eligible-for-intro-pricing)
6. [Testing Intro Pricing with future dates](#testing-intro-pricing-with-future-dates)
7. [Resources](#resources)


> [Apple Docs](https://developer.apple.com/documentation/storekit/in-app_purchase/original_api_for_in-app_purchase/subscriptions_and_offers/implementing_introductory_offers_in_your_app): Apps with auto-renewable subscriptions can offer a discounted introductory price, including a free trial, to eligible users. You can make introductory offers to customers who haven’t previously received an introductory offer for the given product, or for any products in the same subscription group.

> Start by setting up introductory offers in App Store Connect. Then, in your app, determine if the user is eligible to receive an introductory offer. When the app queries the App Store for a list of available products, display the introductory pricing if the user is eligible to receive them.

***

## Testing Eligible and Ineligible Users for Introductory Offers

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

![Screen Shot 2023-03-23 at 8 27 46 PM](https://user-images.githubusercontent.com/1819208/227393273-95ce24ac-3db1-4b7b-8c55-a2409fca8ee7.png)

![Screen Shot 2023-03-23 at 8 28 10 PM](https://user-images.githubusercontent.com/1819208/227393282-49633435-687d-4e8e-a45c-1b02131b89ad.png)

![Screen Shot 2023-03-23 at 8 20 31 PM](https://user-images.githubusercontent.com/1819208/227392454-dd9089ed-cea4-4625-a6aa-faf86d7c3f6f.png)

![Screen Shot 2023-03-23 at 8 22 09 PM](https://user-images.githubusercontent.com/1819208/227392596-fa9eac8b-4a13-45e9-a326-d61e2380bc93.png)

![Screen Shot 2023-03-23 at 8 22 56 PM](https://user-images.githubusercontent.com/1819208/227392671-9622e5a2-6003-4c21-82ab-c24e1d0fc953.png)

![Screen Shot 2023-03-23 at 8 23 57 PM](https://user-images.githubusercontent.com/1819208/227392768-fec1f467-87f9-4fe9-85e6-f9e88ebd7805.png)

![Screen Shot 2023-03-23 at 8 24 44 PM](https://user-images.githubusercontent.com/1819208/227392854-b0e14177-4bc0-45a4-a15a-7504b328232a.png)

![Screen Shot 2023-03-23 at 8 25 10 PM](https://user-images.githubusercontent.com/1819208/227392890-bb67a359-91d2-4239-8e7f-5fcc92f80488.png)

![Screen Shot 2023-03-23 at 8 26 08 PM](https://user-images.githubusercontent.com/1819208/227393024-6d2a5e7f-b51d-407d-9c91-2becd73fda9e.png)

***

## Fetching Intro Pricing 

### 1. Intro Pricing window is current

![Screen Shot 2023-03-23 at 9 11 11 PM](https://user-images.githubusercontent.com/1819208/227399115-ff3a52da-9850-417a-94dc-65123aa0cc5e.png)

```swift
print($0.introductoryPrice?.price ?? "") // $29.99
```

> Note: Intro price IS reflected in the Apple Payment Sheet as the intro pricing offer window is current.

### 2. Intro Pricing window is in the future

![Screen Shot 2023-03-23 at 9 14 16 PM](https://user-images.githubusercontent.com/1819208/227399706-bb1b9b0a-1efc-4390-8e7f-ab8af2345438.png)

```swift
print($0.introductoryPrice?.price ?? "") // $29.99
```

> Note: Intro price IS NOT reflected in the Apple Payment Sheet since the offer is in a future date. Since the intro price is available on the `SKProduct` any UI that depends on using `introductoryPrice == nil` will encounter the pricing is available thus the UI will reflect as so.

***

### Resources 
> If you've set up introductory prices in App Store Connect, the introductory price property will be populated. This property is nil if the product has no introductory price. Before displaying UI that offers the introductory price, you must first determine if the user is eligible to receive it.

* [Apple docs: `introductoryprice`](https://developer.apple.com/documentation/storekit/skproduct/2936878-introductoryprice)
* [Apple docs: `SKProduct`](https://developer.apple.com/documentation/storekit/skproduct)

***

## Determining if the user is eligible for Intro Pricing

> `isEligibleForIntroOffer` is available in StoreKit 2 iOS 15+

```swift
func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
  let products = response.products

  if let product = products.filter({ $0.introductoryPrice != nil }).first,
     let subscriptionGroupIdentifier = product.subscriptionGroupIdentifier {
      print(product.introductoryPrice?.price ?? "") // 29.99
      Task {
          if #available(iOS 15.0, *) {
              if await Product.SubscriptionInfo.isEligibleForIntroOffer(for: subscriptionGroupIdentifier) {
                  print("isEligibleForIntroOffer") // isEligibleForIntroOffer
              } else {
                  print("not eligible")
              }
          } else {
              // Fallback on earlier versions
          }
      }

  }
}
```

## Testing Intro Pricing with future dates 

Below in the screenshot to enable testing intro pricing, we have created two offers. 
* A current offer for testing.
  * Note: only the end date can be changed on a current infro offer.
* A second offer with a future date for Production.
  * All values are editable on future intro offers.

![Screen Shot 2023-03-27 at 9 25 35 PM](https://user-images.githubusercontent.com/1819208/228102768-985e9b5b-996c-4c96-8e61-c39b718d2288.png)


***

## Resources 

* [WWDC 2018: Best Practices and What’s New with In-App Purchases](https://developer.apple.com/videos/play/wwdc2018/704/)
* [Apple docs: Implementing Introductory Offers In Your App](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/subscriptions_and_offers/implementing_introductory_offers_in_your_app)
* [Apple docs: Testing Introductory Offers](https://developer.apple.com/documentation/storekit/original_api_for_in-app_purchase/subscriptions_and_offers/testing_introductory_offers)
* [Apple docs: Set up an introductory offer for an auto-renewable subscription](https://help.apple.com/app-store-connect/#/deve1d49254f)
* [Ray Wenderlich: Introductory Pricing for iOS: Getting Started](https://www.raywenderlich.com/9307-introductory-pricing-for-ios-getting-started)
* [RevenueCat: A Guide to iOS Introductory Prices](https://www.revenuecat.com/blog/ios-introductory-prices/)
* [StackOverflow: How to correctly display the introductory price of an iOS SKProduct?](https://stackoverflow.com/questions/52983778/how-to-correctly-display-the-introductory-price-of-an-ios-skproduct)

## [Back to top](#introductory-offers) ⬆️
