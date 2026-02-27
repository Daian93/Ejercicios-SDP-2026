//: [Previous](@previous)

import Foundation

/*: Desarrolla un programa que calcule la serie de números triangulares hasta un límite dado.
 ALGORITMO: El enésimo número triangular se calcula como la suma de los primeros n números naturales: Tn = 1 + 2 + 3 + ... + n = n(n+1)/2. Los primeros números triangulares son: 1, 3, 6, 10, 15, 21, ... */

let limit = 10  // number of triangular numbers to generate

var triangularNumbers: [Int] = []

for n in 1...limit {
    let Tn = n * (n + 1) / 2
    triangularNumbers.append(Tn)
}

print("First \(limit) triangular numbers:")
print(triangularNumbers)

//: [Next](@next)
