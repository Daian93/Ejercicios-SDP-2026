//: [Previous](@previous)

import Foundation

/*: Desarrolla una función que encuentre el subarray contiguo con la suma máxima (Algoritmo de Kadane) y explica el razonamiento.
 max_ending_here= max(ai, max_ending_here+ ai) para cada elemento ai,
 max_so_far= max (max_so_far, max_ending_here).
 Donde max_ending_here es la suma máxima que se puede obtener terminando en el índice actual y max_so_far la máxima suma en el recorrido. */

func subarrayMaxSuma(_ nums: [Int]) -> (maxSuma: Int, subarray: [Int]) {
    guard !nums.isEmpty else { return (0, []) }

    var maxEndingHere = nums[0]  // Suma máxima terminando en el índice actual.
    var maxSoFar = nums[0]  // Suma máxima encontrada hasta ahora.

    var inicioTemp = 0
    var inicioMax = 0  // Inicio del subarray con suma máxima.
    var finMax = 0  // Fin del subarray con suma máxima.

    for i in 1..<nums.count {
        if nums[i] > maxEndingHere + nums[i] {
            maxEndingHere = nums[i]
            inicioTemp = i  // Empezamos nuevo subarray.
        } else {
            maxEndingHere += nums[i]
        }

        if maxEndingHere > maxSoFar {
            maxSoFar = maxEndingHere
            inicioMax = inicioTemp
            finMax = i
        }
    }

    let subarrayMax = Array(nums[inicioMax...finMax])
    return (maxSoFar, subarrayMax)
}

let numeros = [-3, 2, -4, 5, -2, 3, 2, -6, 5, 4, -1, 2, 1]
let resultado = subarrayMaxSuma(numeros)
print("Suma máxima:", resultado.maxSuma)  // 13
print("Subarray máximo:", resultado.subarray)  // [5, -2, 3, 2, -6, 5, 4, -1, 2, 1]

//: [Next](@next)
