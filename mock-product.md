# Mock Product 

![IMG_1868](https://github.com/alexpaul/in-app-purchases/assets/1819208/3df37c3b-485c-4130-955e-e08b3ddd5c5e)

Mocked from properties on [SKProduct](https://developer.apple.com/documentation/storekit/skproduct)

```swift
import Foundation

struct Product {
    let price: NSDecimalNumber
    let productIdentifier: String
    let introductoryPrice: ProductDiscount?
    let subscriptionPeriod: ProductSubscriptionPeriod?

    enum PeriodUnit {
        case day
        case week
        case month
        case year
    }
}

struct ProductDiscount {
    enum PaymentMode {
        case payAsYouGo
        case payUpFront
        case freeTrial
    }

    let price: NSDecimalNumber
    let numberOfPeriods: Int
    let subscriptionPeriod: ProductSubscriptionPeriod
    let paymentMode: PaymentMode
}

struct ProductSubscriptionPeriod {
    let numberOfUnits: Int
    let unit: Product.PeriodUnit
}

extension ProductSubscriptionPeriod {
    var periodDescription: (duration: Int, unit: String) {
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
        var unit = "unknown-unit"
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
    price: 39.99,
    productIdentifier: "dev.alexpaul.yearly.39.99",
    introductoryPrice: nil,
    subscriptionPeriod: ProductSubscriptionPeriod(
        numberOfUnits: 1,
        unit: .year
    )
)

let monthlyProduct = Product(
    price: 4.99,
    productIdentifier: "dev.alexpaul.monthly.4.99",
    introductoryPrice: ProductDiscount(
        price: 0.00,
        numberOfPeriods: 6,
        subscriptionPeriod: ProductSubscriptionPeriod(
            numberOfUnits: 1,
            unit: .month
        ),
        paymentMode: .payAsYouGo
    ),
    subscriptionPeriod: ProductSubscriptionPeriod(
        numberOfUnits: 1,
        unit: .month
    )
)

if let introPrice = monthlyProduct.introductoryPrice,
   let duration = introPrice.introductoryOffer.duration,
   let unit = introPrice.introductoryOffer.unit {
    print("Monthly product offer: \(duration) \(unit)")
}

if let subscriptionPeriod = monthlyProduct.subscriptionPeriod {
    print("Monthly product: \(subscriptionPeriod.periodDescription.duration) \(subscriptionPeriod.periodDescription.unit)")
}

if let subscriptionPeriod = yearlyProduct.subscriptionPeriod {
    print("Yearly product: \(subscriptionPeriod.periodDescription.duration) \(subscriptionPeriod.periodDescription.unit)")
}

/*
 Monthly product offer: 6 months
 Monthly product: 1 month
 Yearly product: 1 year
 */
```
