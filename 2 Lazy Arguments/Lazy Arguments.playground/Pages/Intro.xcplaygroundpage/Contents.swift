//: Playground - noun: a place where people can play

import UIKit

let lazyDouble = Lazy<Double> {
    print("Perform Complex Calculation")
    return 2 + 8
}

print("Start Loop")
(0..<5).forEach { _ in
    print(lazyDouble.value)
}
