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
    var periodDescription: String {
        guard let introPrice = introductoryPrice else {
            return ""
        }
        let plural = introPrice.subscriptionPeriod.numberOfUnits > 1
        switch introPrice.subscriptionPeriod.unit {
        case .day: 
            return "day"
        case .week: 
            return "\(introPrice.subscriptionPeriod.numberOfUnits) \(plural ? "weeks" : "week")"
        case .month: 
            return "month"
        case .year: 
            return "year"
        default: 
            break
        }
        return "unknown"
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

print(monthlyProduct.introductoryPrice?.price)
print(monthlyProduct.periodDescription)
```
