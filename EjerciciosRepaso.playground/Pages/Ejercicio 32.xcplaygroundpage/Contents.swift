//: [Previous](@previous)

import Foundation

/*: Escribe una función que devuelva un closure. Este closure deberá capturar y mantener un contador interno que incremente su valor cada vez que se invoque. Llama al closure varias veces y observa la evolución del contador. */

func crearContador() -> () -> Int {
    var count: Int = 0
    return {
        count += 1
        return count
    }
}

let contador1 = crearContador()

print(contador1())  // 1
print(contador1())  // 2
print(contador1())  // 3
print(contador1())  // 4

let contador2 = crearContador()
print(contador2())  // 1
print(contador2())  // 2
print(contador1())  // 5

//: [Next](@next)
