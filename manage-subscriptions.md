# Manage Subscriptions 

> [Apple: Auto-renewable subscriptions](https://developer.apple.com/app-store/subscriptions/): People can manage their subscriptions in their account settings on the App Store, where they see all renewal options and subscription groups, and can choose to upgrade, crossgrade, or downgrade between subscriptions as often as they like. You can also use the `showManageSubscriptions(in:)` method to allow them to do this within your app. 

* Upgrades. An upgrade example can be that you may notice the user has purchased a monthly product and renewed for multiple consecutive periods. By offering an upgrade to an annual subscription, you can provide a discount and reward your most loyal subscribers. See [WWDC2020: Architecting for subscriptions](https://developer.apple.com/videos/play/wwdc2020/10671) for more.
* Downgrades.
* Crossgrade. 

[`showManageSubscriptions(in:)`](https://developer.apple.com/documentation/storekit/appstore/3803198-showmanagesubscriptions): Presents the App Store sheet for managing subscriptions.

## 1. Creating Auto-Renewal Subscripitons 

![Screen Shot 2023-03-31 at 5 30 25 PM](https://user-images.githubusercontent.com/1819208/229236297-caf16c0b-bf43-4584-9fcc-85c8caa74d46.png)

![Screen Shot 2023-03-31 at 5 32 23 PM](https://user-images.githubusercontent.com/1819208/229236625-d578355f-79a5-4319-85b5-521f5cad5e39.png)

![Screen Shot 2023-03-31 at 5 46 35 PM](https://user-images.githubusercontent.com/1819208/229238775-b6f32341-7938-4aa8-8c9f-a2f8a9626319.png)

![Screen Shot 2023-03-31 at 8 09 32 PM](https://user-images.githubusercontent.com/1819208/229255055-8be72927-69f4-4765-9966-cac2d150dba6.png)

```swift
Text(product.localizedTitle) // Display Name from App Store Connect
Text(product.localizedDescription) // Description from App Store Connect
```

***

## 2. Receipt shows user has upgraded to a higher level Subscription tier 

Subscription Tiers:   
* Level 1: "premiumPlus"
* Level 2: "premium"

```
"latest_receipt_info" =     (
                {
            "expires_date" = "2023-04-02 02:12:06 Etc/GMT";
            "expires_date_ms" = 1680401526000;
            "expires_date_pst" = "2023-04-01 19:12:06 America/Los_Angeles";
            "in_app_ownership_type" = PURCHASED;
            "is_in_intro_offer_period" = false;
            "is_trial_period" = false;
            "original_purchase_date" = "2023-04-02 02:04:51 Etc/GMT";
            "original_purchase_date_ms" = 1680401091000;
            "original_purchase_date_pst" = "2023-04-01 19:04:51 America/Los_Angeles";
            "original_transaction_id" = 2000000306233571;
            "product_id" = "dev.alexpaul.#######.premiumPlus";
            "purchase_date" = "2023-04-02 02:07:06 Etc/GMT";
            "purchase_date_ms" = 1680401226000;
            "purchase_date_pst" = "2023-04-01 19:07:06 America/Los_Angeles";
            quantity = 1;
            "subscription_group_identifier" = 123456789
            "transaction_id" = 2000000306233658;
            "web_order_line_item_id" = 2000000024363433;
        },
                {
            "expires_date" = "2023-04-02 02:09:44 Etc/GMT";
            "expires_date_ms" = 1680401384000;
            "expires_date_pst" = "2023-04-01 19:09:44 America/Los_Angeles";
            "in_app_ownership_type" = PURCHASED;
            "is_in_intro_offer_period" = false;
            "is_trial_period" = false;
            
            // Here in the receipt we can see that the user has upgraded from "premium" to "premiumPlus"
            "is_upgraded" = true;
            
            "original_purchase_date" = "2023-04-02 02:04:51 Etc/GMT";
            "original_purchase_date_ms" = 1680401091000;
            "original_purchase_date_pst" = "2023-04-01 19:04:51 America/Los_Angeles";
            "original_transaction_id" = 2000000306233571;
            "product_id" = "dev.alexpaul.#######.premium";
            "purchase_date" = "2023-04-02 02:04:44 Etc/GMT";
            "purchase_date_ms" = 1680401084000;
            "purchase_date_pst" = "2023-04-01 19:04:44 America/Los_Angeles";
            quantity = 1;
            "subscription_group_identifier" = 123456789;
            "transaction_id" = 2000000306233571;
            "web_order_line_item_id" = 2000000024363432;
        }
    )
```

***

## 3. Pending Renewal Info

> Note: `pending_renewal_info` after a downgrade. 

```
"pending_renewal_info" =     (
            {
        "auto_renew_product_id" = "dev.alexpaul.######.premium";
        "auto_renew_status" = 1;
        "original_transaction_id" = 2000000306321289;
        "product_id" = "dev.alexpaul.######.premiumPlus";
    }
);
```

***

## 4. Demo App

https://user-images.githubusercontent.com/1819208/229941952-eedac8c3-d201-4bd2-a864-954685406358.mov

## 5. Price Increases 

> [Manage pricing for auto-renewable subscriptions](https://developer.apple.com/help/app-store-connect/manage-subscriptions/manage-pricing-for-auto-renewable-subscriptions) Increases in auto-renewable subscription prices result in either a notice to active subscribers or a request for consent, based on certain criteria below. Subscribers on introductory or promotional price subscriptions, including free trials and paid offers, will renew for at least one more billing period at the price that was displayed when they subscribed, to ensure their notice or request for consent for the new price is sent at least 30 days in advance. If a subscriber doesn’t consent before the first renewal at the higher price, their subscription will expire at the end of the last billing cycle at the former price.

***

## Resources 

* [WWDC2020: Architecting for subscriptions](https://developer.apple.com/videos/play/wwdc2020/10671) ⭐️
* [Apple docs: Auto-renewable subscriptions](https://developer.apple.com/app-store/subscriptions/)
* [Apple docs: Learn more about subscription upgrades and downgrades](https://developer.apple.com/go/?id=subscriptions-overview)
* [Apple docs: Offer auto-renewable subscriptions](https://developer.apple.com/help/app-store-connect/manage-subscriptions/offer-auto-renewable-subscriptions)
* [Apple docs: Overview for configuring in-app purchases](https://developer.apple.com/help/app-store-connect/configure-in-app-purchase-settings/overview-for-configuring-in-app-purchases)
