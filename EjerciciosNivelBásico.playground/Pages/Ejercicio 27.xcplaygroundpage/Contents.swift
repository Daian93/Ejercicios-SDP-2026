//: [Previous](@previous)

import Foundation

/*: Crea un programa que calcule el número de formas distintas de dar cambio de una cantidad usando monedas específicas. */

let amount = 5
let coins = [1, 2, 5]

// Initialize array
var ways = Array(repeating: 0, count: amount + 1)
ways[0] = 1  // One way to make 0

// Compute number of ways
for coin in coins {
    for i in coin...amount {
        ways[i] += ways[i - coin]
    }
}

print("Amount: \(amount)")
print("Coins: \(coins)")
print("Number of ways to make change: \(ways[amount])")

//: [Next](@next)
