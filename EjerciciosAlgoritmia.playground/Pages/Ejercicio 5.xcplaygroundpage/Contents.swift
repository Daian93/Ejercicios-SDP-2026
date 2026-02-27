//: [Previous](@previous)

import Foundation

/*: Crea una función que determine si una palabra es palíndroma sin usar directamente el método de inversión de cadena, sino aplicando técnicas funcionales. */

func esPalindroma(_ palabra: String) -> Bool {
    let caracteres = Array(palabra.lowercased())

    let mitad = caracteres.count / 2

    return (0..<mitad).allSatisfy { i in
        caracteres[i] == caracteres[caracteres.count - 1 - i]
    }
}

print(esPalindroma("radar"))  // true
print(esPalindroma("Reconocer"))  // true
print(esPalindroma("Swift"))  // false
print(esPalindroma("camino"))  // false

//: [Next](@next)
