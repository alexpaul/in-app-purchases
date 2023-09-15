# Mock Product 

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
    let price: NSDecimalNumber
    let numberOfPeriods: Int
    let subscriptionPeriod: ProductSubscriptionPeriod
}

struct ProductSubscriptionPeriod {
    let numberOfUnits: Int
    let unit: Product.PeriodUnit
}

extension ProductSubscriptionPeriod {
    var periodDescription: (numberOfUnits: Int, period: String) {
        let plural = numberOfUnits > 1
        let period: String
        switch unit {
        case .day: // 0 
            period = plural ? "days" : "day"
        case .week: // 1
            period = plural ? "weeks" : "week"
        case .month: // 2
            period = plural ? "months" : "month"
        case .year: // 3
            period = plural ? "years" : "year"
        }
        return (numberOfUnits, period)
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
        numberOfPeriods: 1,
        subscriptionPeriod: ProductSubscriptionPeriod(
            numberOfUnits: 2,
            unit: .week
        )
    ),
    subscriptionPeriod: ProductSubscriptionPeriod(
        numberOfUnits: 1,
        unit: .month
    )
)

if let introPrice = monthlyProduct.introductoryPrice {
    print("Monthly offer: \(introPrice.subscriptionPeriod.periodDescription.numberOfUnits) \(introPrice.subscriptionPeriod.periodDescription.period)")
}

if let subscriptionPeriod = monthlyProduct.subscriptionPeriod {
    print("Monthly product: \(subscriptionPeriod.periodDescription.numberOfUnits) \(subscriptionPeriod.periodDescription.period)")
}

if let subscriptionPeriod = yearlyProduct.subscriptionPeriod {
    print("Yearly product: \(subscriptionPeriod.periodDescription.numberOfUnits) \(subscriptionPeriod.periodDescription.period)")
}

/*
 Monthly offer: 2 weeks
 Monthly product: 1 month
 Yearly product: 1 year
 */
```
