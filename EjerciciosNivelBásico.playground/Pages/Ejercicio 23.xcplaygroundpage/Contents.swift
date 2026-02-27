//: [Previous](@previous)

import Foundation

/*: Implementa un programa que compruebe si un número es parte de la secuencia de números de Armstrong.
 ALGORITMO: Un número de Armstrong es aquel que es igual a la suma de sus dígitos elevados a la potencia del número de dígitos. Por ejemplo, 153 = 1³ + 5³ + 3³ = 1 + 125 + 27 = 153. */

let number = 153
var sum = 0
let digits = String(number).map { Int(String($0))! }
let power = digits.count

for digit in digits {
    sum += Int(pow(Double(digit), Double(power)))
}

print("Number: \(number)")
print("Is Armstrong? \(sum == number ? "Yes" : "No")")

//: [Next](@next)
