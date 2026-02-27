//: [Previous](@previous)

import Foundation

/*: Dado un array de enteros, genera un diccionario en el que cada clave sea el número y su valor el cuadrado del mismo, aprovechando map. */

let numeros = [1, 2, 3, 4, 5]

// Generamos el diccionario: clave = número, valor = cuadrado. Sin embargo, tenemos que tener en cuenta que al usar uniqueKeysWithValues no podemos tener dos enteros duplicados en el array.
let cuadrados = Dictionary(uniqueKeysWithValues: numeros.map { ($0, $0 * $0) })

print(cuadrados)

// Por ello, otra forma más sencilla de resolver este ejercicio es utilizando un 'forEach'. Así, podemos tener números enteros duplicados en el Array. Lo que ocurre es que la clave se sobrescribe cada vez que aparece el mismo número:

let numeros2 = [1, 2, 2, 3, 4, 5]

var cuadrados2: [Int: Int] = [:]

numeros2.map { numero in
    (numero, numero * numero)
}.forEach { clave, valor in
    cuadrados2[clave] = valor
}

print(cuadrados2)

//: [Next](@next)
