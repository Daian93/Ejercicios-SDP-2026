//: [Previous](@previous)

import Foundation

/*: Implementa un algoritmo para convertir un número romano a decimal.
 ALGORITMO: Los números romanos utilizan combinaciones de letras (I=1, V=5, X=10, L=50, C=100, D=500, M=1000). Si un símbolo de menor valor aparece antes que uno de mayor valor, se resta; de lo contrario, se suma. */

let roman = "MCMXV"

// Roman to decimal mapping
let romanValues: [Character: Int] = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
]

var total = 0
let chars = Array(roman)

for i in 0..<chars.count {
    let current = romanValues[chars[i]]!

    if i + 1 < chars.count {
        let next = romanValues[chars[i + 1]]!
        if current < next {
            total -= current
        } else {
            total += current
        }
    } else {
        total += current
    }
}

print("Roman numeral: \(roman)")
print("Decimal value: \(total)")

//: [Next](@next)
