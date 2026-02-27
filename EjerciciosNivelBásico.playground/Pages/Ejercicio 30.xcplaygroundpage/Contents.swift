//: [Previous](@previous)

import Foundation

/*: Crea un programa que calcule la distancia de Levenshtein entre dos cadenas.
 ALGORITMO: La distancia de Levenshtein es el número mínimo de operaciones (inserción, eliminación, sustitución) necesarias para transformar una cadena en otra. Es una medida de la similitud entre dos cadenas. Por cada carácter que haya que poner, quitar o sustituir, sumamos uno para convertir una palabra en otra. Por ejemplo:

     De "algoritmo" a "logaritmo"
     Eliminar la 'a' inicial (queda "lgoritmo")
     Insertar 'o' después de la 'l' (queda "logoritmo")
     Eliminar la 'o' después de la 'g' (queda "logaritmo")
     La distancia de Levenshtein es 3. */

let str1 = "algoritmo"
let str2 = "logaritmo"

// Convert strings to arrays of characters
let a = Array(str1)
let b = Array(str2)

// Initialize DP table
var dp = Array(
    repeating: Array(repeating: 0, count: b.count + 1),
    count: a.count + 1
)

// Base cases
for i in 0...a.count {
    dp[i][0] = i  // deletion from a
}
for j in 0...b.count {
    dp[0][j] = j  // insertion to a
}

// Fill DP table
for i in 1...a.count {
    for j in 1...b.count {
        if a[i - 1] == b[j - 1] {
            dp[i][j] = dp[i - 1][j - 1]  // no operation needed
        } else {
            dp[i][j] = min(
                dp[i - 1][j] + 1,  // deletion
                dp[i][j - 1] + 1,  // insertion
                dp[i - 1][j - 1] + 1  // substitution
            )
        }
    }
}

let distance = dp[a.count][b.count]

print("String 1: \(str1)")
print("String 2: \(str2)")
print("Levenshtein distance: \(distance)")

//: [Next](@next)
