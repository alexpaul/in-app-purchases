# Mock Product 

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

extension Product {
    var periodDescription: (numberOfUnits: Int, period: String) {
        guard let introPrice = introductoryPrice else {
            return (-1,"")
        }
        let plural = introPrice.subscriptionPeriod.numberOfUnits > 1
        let period: String
        switch introPrice.subscriptionPeriod.unit {
        case .day:
            period = plural ? "days" : "day"
        case .week:
            period = plural ? "weeks" : "week"
        case .month:
            period = plural ? "months" : "month"
        case .year:
            period = plural ? "years" : "year"
        }
        return (introPrice.subscriptionPeriod.numberOfUnits, period)
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

print("\(monthlyProduct.periodDescription.numberOfUnits) \(monthlyProduct.periodDescription.period)")
// 2 weeks
```
