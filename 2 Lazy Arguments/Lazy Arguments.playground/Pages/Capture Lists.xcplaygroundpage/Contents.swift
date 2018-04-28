import Foundation

// Without Capturing
/*
var values = [5.0, 10.0, 15.0]

let lazyAverage = Lazy<Double> {
    values.reduce(0, +) / Double(values.count)
}

values[2] = 0

print("Average: \(lazyAverage.value)")
*/

// With Capturing

var values = [5.0, 10.0, 15.0]

let lazyAverage = Lazy<Double> { [values] in // <-- Copy values
    values.reduce(0, +) / Double(values.count)
}

values[2] = 0

print("Average: \(lazyAverage.value)")


