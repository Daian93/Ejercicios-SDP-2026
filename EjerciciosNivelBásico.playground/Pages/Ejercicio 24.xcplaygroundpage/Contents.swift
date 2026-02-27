//: [Previous](@previous)

import Foundation

/*: Crea un algoritmo que calcule el producto escalar de dos vectores (representados como arrays).
 ALGORITMO: El producto escalar de dos vectores se calcula multiplicando los componentes correspondientes y sumando los resultados: a·b = a₁×b₁ + a₂×b₂ + ... + aₙ×bₙ. */

let vectorA = [1, 3, -5]
let vectorB = [4, -2, -1]

// Check that vectors have the same size
guard vectorA.count == vectorB.count else {
    fatalError("Vectors must have the same length")
}

// Calculate dot product
var dotProduct = 0
for i in 0..<vectorA.count {
    dotProduct += vectorA[i] * vectorB[i]
}

print("Vector A: \(vectorA)")
print("Vector B: \(vectorB)")
print("Dot product: \(dotProduct)")

//: [Next](@next)
