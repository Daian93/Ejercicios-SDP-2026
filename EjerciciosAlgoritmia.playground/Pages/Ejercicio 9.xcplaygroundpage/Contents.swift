//: [Previous](@previous)

import Foundation

/*: Implementa una función que cuente la cantidad de vocales en una cadena, utilizando filter y reduce. */

func contarVocales(en cadena: String) -> Int {
    let vocales = "aeiouáéíóú"
    let textoMinuscula = cadena.lowercased()
    return textoMinuscula.filter { vocales.contains($0) }.reduce(0) { acc, _ in acc + 1 }
}

print(contarVocales(en: "Hola, me llamo Diana. Estoy aprendiendo Swift con mucha ilusión."))

//: [Next](@next)
