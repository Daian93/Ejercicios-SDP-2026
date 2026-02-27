//: [Previous](@previous)

import Foundation

/*: Diseña un algoritmo que reciba dos números (que pueden ser de tipos distintos) y determine si el primero es múltiplo del segundo. Considera casos con y sin decimales, y argumenta qué ocurre en cada situación. */

// Empezamos diseñando el algoritmo, usando Double ya que casi todos los tipos numéricos se pueden convertir en Double y así también se permite el uso de decimales:
func esMultiplo(_ a: Double, de b: Double) -> Bool {

    // Caso especial: no se puede dividir entre 0
    if b == 0 {
        return false
    }

    // Dividimos el primer número entre el segundo
    let division = a / b

    // Comprobamos si el resultado es un número entero
    // Usamos una tolerancia por los errores de precisión de Double
    let tolerancia = 0.000001

    return abs(division.rounded() - division) < tolerancia
}

// Ahora, mostramos ejemplos del caso con y sin decimales:

// Enteros
esMultiplo(20, de: 10)  // true
esMultiplo(20, de: 7)  // false

// Destacar que en este caso, cuando AMBOS números son enteros, lo ideal sería utilizar el operador %. Es exacto y seguro y no hay errores de precisión. Por ejemplo:

let example: Bool = 20 % 10 == 0  // true

// Sin embargo, no existe el operador % para Double o Float y por ello se utiliza la división. En problema que puede aparecer es que los decimales en binario no son siempre exactos, por lo que se ha usado una tolerancia.

// Decimales exactos
esMultiplo(12.5, de: 2.5)  // true
esMultiplo(7.25, de: 0.25)  // true

// Decimales no exactos
esMultiplo(12.0, de: 0.7)  // false

//: [Next](@next)
