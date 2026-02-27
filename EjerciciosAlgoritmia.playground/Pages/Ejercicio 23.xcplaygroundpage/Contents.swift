//: [Previous](@previous)

import Foundation

/* Crea una función que reciba un array anidado (arrays dentro de arrays) y lo aplane en un solo array. */

enum Elemento<T> {
    case valor(T)
    case lista([Elemento<T>])
}

func aplanar<T>(_ elementos: [Elemento<T>]) -> [T] {
    return elementos.flatMap { elemento in
        switch elemento {
        case .valor(let v):
            return [v]
        case .lista(let lista):
            return aplanar(lista)
        }
    }
}

let lista: [Elemento<Int>] = [
    .valor(1),
    .lista([
        .valor(2),
        .valor(3),
    ]),
    .lista([
        .valor(4),
        .valor(5),
    ]),
]

let plano = aplanar(lista)
print(plano)

//Sin embargo, si el array anidado fuese bidimensional de tipo [[Int]], la siguiente solución sería más adecuada:

func flatten(_ array: [[Int]]) -> [Int] {
    return array.flatMap(\.self)
}

let array: [[Int]] = [[1, 2], [3, 4, 5], [6]]
print(flatten(array))

//: [Next](@next)
