//: [Previous](@previous)

import Foundation

/*: Implementa una función recursiva (divide y vencerás) para calcular xⁿ.
 xⁿ = {1, si n = 0,
 x × xⁿ-1, si n > 0. */

func potencia(_ x: Int, _ n: Int) -> Int {
    // Caso base
    if n == 0 {
        return 1
    }

    // Caso recursivo
    return x * potencia(x, n - 1)
}

print(potencia(2, 3))

// Sin embargo, esta es la implementación recursiva básica. Una versión más eficiente es la de Divide y Vencerás. La idea es que si n es par xⁿ=(xⁿ/2)^2 y si n es impar xⁿ=x⋅xⁿ−1.

func potenciaDyV(_ x: Int, _ n: Int) -> Int {
    // Caso base
    if n == 0 {
        return 1
    }

    // Divide
    let mitad = potenciaDyV(x, n / 2)

    // Vence
    if n % 2 == 0 {
        return mitad * mitad
    } else {
        return x * mitad * mitad
    }
}

print(potenciaDyV(2, 8))


//: [Next](@next)
