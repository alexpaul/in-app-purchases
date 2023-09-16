# Mock Product 

![IMG_1868](https://github.com/alexpaul/in-app-purchases/assets/1819208/3df37c3b-485c-4130-955e-e08b3ddd5c5e)

## Mocked from properties on [SKProduct](https://developer.apple.com/documentation/storekit/skproduct) , 

> `SKProduct` is part of the Original API for in-app purchases "StoreKit 1". 

```swift
import Foundation

struct Product {
    // Product Identifier
    let productIdentifier: String

    // Pricing Information
    let price: NSDecimalNumber
    let introductoryPrice: ProductDiscount?

    // Subscription Information
    let subscriptionGroupIdentifier: String?
    /// This property is nil if the SKProduct isn’t an auto-renewable subscription.
    let subscriptionPeriod: ProductSubscriptionPeriod?

    enum PeriodUnit {
        case day
        case week
        case month
        case year
    }
}

struct ProductDiscount {
    // Price and Payment Mode
    let price: NSDecimalNumber
    let paymentMode: PaymentMode

    enum PaymentMode: Int {
        case payAsYouGo // 0
        case payUpFront
        case freeTrial
    }

    // Discount Duration
    let numberOfPeriods: Int
    let subscriptionPeriod: ProductSubscriptionPeriod
}

struct ProductSubscriptionPeriod {
    let numberOfUnits: Int
    let unit: Product.PeriodUnit
}

extension ProductDiscount.PaymentMode {
    var formattedDescription: String {
        switch self {
        case .payAsYouGo:
            return "Pay as you go"
        case .payUpFront:
            return "Pay up front"
        case .freeTrial:
            return "Free trial"
        }
    }
}

extension ProductSubscriptionPeriod {
    var subscriptionOffer: (duration: Int, unit: String) {
        let plural = numberOfUnits > 1
        let unitDescription: String
        switch unit {
        case .day: // 0
            unitDescription = plural ? "days" : "day"
        case .week: // 1
            unitDescription = plural ? "weeks" : "week"
        case .month: // 2
            unitDescription = plural ? "months" : "month"
        case .year: // 3
            unitDescription = plural ? "years" : "year"
        }
        return (numberOfUnits, unitDescription)
    }
}

extension ProductDiscount {
    /// `freeTrial` uses `numberOfUnits`
    /// `payAsYouGo` uses `numberOfPeriods`
    var introductoryOffer: (duration: Int?, unit: String?) {
        var plural = false
        var unit = ""
        var duration = 0

        switch paymentMode {
        case .payAsYouGo:
            duration = numberOfPeriods
            plural = numberOfPeriods > 1
        case .freeTrial:
            duration = subscriptionPeriod.numberOfUnits
            plural = subscriptionPeriod.numberOfUnits > 1
        default:
            break
        }

        switch subscriptionPeriod.unit {
        case .day:
            unit = plural ? "days" : "day"
        case .week:
            unit = plural ? "weeks" : "week"
        case .month:
            unit = plural ? "months" : "month"
        case .year:
            unit = plural ? "years" : "year"
        }
        return (duration, unit)
    }
}

let yearlyProduct = Product(
    productIdentifier: "dev.alexpaul.yearly.39.99", price: 39.99,
    introductoryPrice: nil,
    subscriptionGroupIdentifier: nil,
    subscriptionPeriod: ProductSubscriptionPeriod(
        numberOfUnits: 1,
        unit: .year
    )
)

let monthlyProduct = Product(
    productIdentifier: "dev.alexpaul.monthly.4.99", price: 4.99,
    introductoryPrice: ProductDiscount(
        price: 0.00,
        paymentMode: .freeTrial, numberOfPeriods: 6,
        subscriptionPeriod: ProductSubscriptionPeriod(
            numberOfUnits: 2,
            unit: .week
        )
    ),
    subscriptionGroupIdentifier: nil,
    subscriptionPeriod: ProductSubscriptionPeriod(
        numberOfUnits: 1,
        unit: .month
    )
)

if let introPrice = monthlyProduct.introductoryPrice,
   let duration = introPrice.introductoryOffer.duration,
   let unit = introPrice.introductoryOffer.unit {
    print("Monthly introductory offer: \(duration) \(unit) \(introPrice.paymentMode.formattedDescription)")
}

if let subscriptionPeriod = monthlyProduct.subscriptionPeriod {
    print("Monthly product: \(subscriptionPeriod.subscriptionOffer.duration) \(subscriptionPeriod.subscriptionOffer.unit)")
}

if let subscriptionPeriod = yearlyProduct.subscriptionPeriod {
    print("Yearly product: \(subscriptionPeriod.subscriptionOffer.duration) \(subscriptionPeriod.subscriptionOffer.unit)")
}

/*
 Monthly introductory offer: 2 weeks Free trial
 Monthly product: 1 month
 Yearly product: 1 year
 */
```
