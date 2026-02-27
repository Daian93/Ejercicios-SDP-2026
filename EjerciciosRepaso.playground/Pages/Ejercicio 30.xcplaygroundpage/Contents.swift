//: [Previous](@previous)

import Foundation

/*: Escribe una función que reciba un array de enteros y un closure que defina una condición (por ejemplo, que verifique si un número es par o impar). La función debe retornar un array con aquellos números que cumplan la condición. Prueba con distintas condiciones. */

func filtrarNumeros(_ numeros: [Int], con condicion: (Int) -> Bool) -> [Int] {
    var resultado: [Int] = []

    for numero in numeros {
        if condicion(numero) {
            resultado.append(numero)
        }
    }

    return resultado
}

let numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let pares = filtrarNumeros(numeros) { $0 % 2 == 0 }
print("Números pares: \(pares)")  // [2, 4, 6, 8, 10]

let impares = filtrarNumeros(numeros) { $0 % 2 != 0 }
print("Números impares: \(impares)")  // [1, 3, 5, 7, 9]

let mayoresQueCinco = filtrarNumeros(numeros) { $0 > 5 }
print("Números mayores que 5: \(mayoresQueCinco)")  // [6, 7, 8, 9, 10]

let multiplosDeTres = filtrarNumeros(numeros) { $0 % 3 == 0 }
print("Múltiplos de 3: \(multiplosDeTres)")  // [3, 6, 9]

//: [Next](@next)
