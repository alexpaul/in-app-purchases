# Manage Subscriptions 

> [Apple: Auto-renewable subscriptions](https://developer.apple.com/app-store/subscriptions/): People can manage their subscriptions in their account settings on the App Store, where they see all renewal options and subscription groups, and can choose to upgrade, crossgrade, or downgrade between subscriptions as often as they like. You can also use the `showManageSubscriptions(in:)` method to allow them to do this within your app. 

* Upgrades. An upgrade example can be that you may notice the user has purchased a monthly product and renewed for multiple consecutive periods. By offering an upgrade to an annual subscription, you can provide a discount and reward your most loyal subscribers. See [WWDC2020: Architecting for subscriptions](https://developer.apple.com/videos/play/wwdc2020/10671) for more.
* Downgrades.
* Crossgrade. 

[`showManageSubscriptions(in:)`](https://developer.apple.com/documentation/storekit/appstore/3803198-showmanagesubscriptions): Presents the App Store sheet for managing subscriptions.

![Screen Shot 2023-03-31 at 5 30 25 PM](https://user-images.githubusercontent.com/1819208/229236297-caf16c0b-bf43-4584-9fcc-85c8caa74d46.png)

![Screen Shot 2023-03-31 at 5 32 23 PM](https://user-images.githubusercontent.com/1819208/229236625-d578355f-79a5-4319-85b5-521f5cad5e39.png)

![Screen Shot 2023-03-31 at 5 46 35 PM](https://user-images.githubusercontent.com/1819208/229238775-b6f32341-7938-4aa8-8c9f-a2f8a9626319.png)

***

## Resources 

* [WWDC2020: Architecting for subscriptions](https://developer.apple.com/videos/play/wwdc2020/10671) ⭐️
* [Apple docs: Auto-renewable subscriptions](https://developer.apple.com/app-store/subscriptions/)
* [Apple docs: Learn more about subscription upgrades and downgrades](https://developer.apple.com/go/?id=subscriptions-overview)
* [Apple docs: Offer auto-renewable subscriptions](https://developer.apple.com/help/app-store-connect/manage-subscriptions/offer-auto-renewable-subscriptions)
* [Apple docs: Overview for configuring in-app purchases](https://developer.apple.com/help/app-store-connect/configure-in-app-purchase-settings/overview-for-configuring-in-app-purchases)
