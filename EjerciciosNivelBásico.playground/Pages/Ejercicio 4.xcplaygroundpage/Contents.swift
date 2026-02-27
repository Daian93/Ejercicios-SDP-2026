//: [Previous](@previous)

import Foundation

/*: Realice un programa capaz de determinar si una cadena contiene un valor que sea palíndromo. Deberá rechazar cuando la cadena contenga más de una palabra para evitar errores.
 ALGORITMO: Una palabra palíndroma se lee igual en ambos sentidos. */

func isPalindrome(_ text: String) -> Bool {
    // Reject if there is more than one word
    if text.contains(" ") {
        print("Error: the string contains more than one word.")
        return false
    }

    // Convert to lowercase
    let word = text.lowercased()

    // Reverse the word
    let reverse = String(word.reversed())

    // Compare
    return word == reverse
}

let word = "radar"

if isPalindrome(word) {
    print("'\(word )' es palíndromo.")
} else {
    print("'\(word )' no es palíndromo.")
}

//: [Next](@next)
