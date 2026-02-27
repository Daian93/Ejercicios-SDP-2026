//: [Previous](@previous)

import Foundation

/*: Crea un programa que determine si una cadena de texto es un anagrama de otra.
 ALGORITMO: Dos palabras son anagramas si tienen exactamente las mismas letras pero en distinto orden. Puedes comparar las frecuencias de las letras en ambas cadenas. */

let str1 = "listen"
let str2 = "silent"

// Normalize strings: lowercase and remove spaces
let s1 = str1.lowercased().filter { $0.isLetter }
let s2 = str2.lowercased().filter { $0.isLetter }

// Function to count letter frequencies
func letterFrequency(_ text: String) -> [Character: Int] {
    var freq: [Character: Int] = [:]
    for char in text {
        freq[char, default: 0] += 1
    }
    return freq
}

// Compare frequencies
let isAnagram = letterFrequency(s1) == letterFrequency(s2)

// Output
print("String 1: \(str1)")
print("String 2: \(str2)")
print("Are they anagrams? \(isAnagram ? "Yes" : "No")")

//: [Next](@next)
