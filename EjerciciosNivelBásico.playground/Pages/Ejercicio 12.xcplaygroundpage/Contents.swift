//: [Previous](@previous)

import Foundation

/*: Implementa un algoritmo para convertir un número decimal a su representación binaria.
 ALGORITMO: Para convertir un decimal a binario, divide repetidamente el número entre 2 y anota los restos. El número binario será la secuencia de restos leída de abajo hacia arriba. */

var decimalNumber = 23
var number = decimalNumber

// Check for 0
if number == 0 {
    print("Binary representation of 0 is 0")
} else {
    var binaryString = ""

    while number > 0 {
        let remainder = number % 2
        binaryString = String(remainder) + binaryString
        number /= 2
    }

    print("Decimal number: \(decimalNumber)")
    print("Binary representation: \(binaryString)")
}

//: [Next](@next)
