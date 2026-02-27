//: [Previous](@previous)

import Foundation

/*: Crea un algoritmo que calcule el máximo común divisor (MCD) de dos números enteros positivos.
 ALGORITMO: El MCD es el número más grande que divide a ambos números sin dejar resto. Puedes utilizar el algoritmo de Euclides: divide el número mayor entre el menor y quédate con el resto. Luego divide el divisor entre el resto obtenido. Continúa hasta que el resto sea cero. El último divisor será el MCD. */

var a: Int = 48
var b: Int = 18
var aux: Int = 0

while b != 0 {
    aux = b
    b = a % b
    a = aux
}

print("The GCD is \(a)")

/* Another simpler way:
var a = 48
var b = 18

while b != 0 {
    (a, b) = (b, a % b)  // swap and compute remainder in one line
}

print("The GCD is \(a)")
*/

//: [Next](@next)
