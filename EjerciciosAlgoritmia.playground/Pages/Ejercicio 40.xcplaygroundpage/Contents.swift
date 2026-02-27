//: [Previous](@previous)

import Foundation

/*: Escribe una función recursiva que convierta un número entero a su representación en una base arbitraria (entre 2 y 16), aplicando técnicas funcionales.
 N= d0 + d1 b + d2 b2 + … + dm bm. */

// Sin aplicar técnicas funcionales:
func enteroABase(_ numero: Int, base: Int) -> String {
    precondition(base >= 2 && base <= 16, "La base debe estar entre 2 y 16")

    let digitos = Array("0123456789ABCDEF")

    // Caso base.
    if numero < base {
        return String(digitos[numero])
    }

    // Caso recursivo.
    return enteroABase(numero / base, base: base)
        + String(digitos[numero % base])
}

// Si aplicamos técnicas funcionales:
func enteroABaseFuncional(_ numero: Int, base: Int) -> String {
    precondition(base >= 2 && base <= 16, "La base debe estar entre 2 y 16")

    let digitos = Array("0123456789ABCDEF")

    // Creamos un array con los restos al dividir sucesivamente entre la base.
    let restos: [Int] = sequence(first: numero) { $0 >= base ? $0 / base : nil }
        .map { $0 % base }

    // Reducimos a String concatenando los dígitos en orden inverso.
    return restos.reversed().reduce("") { $0 + String(digitos[$1]) }
}

print(enteroABaseFuncional(255, base: 2))  // "11111111"
print(enteroABaseFuncional(255, base: 8))  // "377"
print(enteroABaseFuncional(255, base: 16))  // "FF"
print(enteroABaseFuncional(1234, base: 10))  // "1234"
print(enteroABaseFuncional(1234, base: 16))  // "4D2"

//: [Next](@next)
