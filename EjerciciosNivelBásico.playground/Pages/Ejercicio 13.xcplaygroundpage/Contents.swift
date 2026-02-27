//: [Previous](@previous)

import Foundation

/*: Crea un programa que, dado un texto, cuente la frecuencia de cada letra y muestre las 3 letras más frecuentes. */

let text = "My name is Diana and I love Swift programming!"

// Normalize text: lowercase and keep only letters
let lettersOnly = text.lowercased().filter { $0.isLetter }

// Count frequency of each letter
var frequency: [Character: Int] = [:]

for char in lettersOnly {
    frequency[char, default: 0] += 1
}

// Sort by frequency descending
let sortedFrequency = frequency.sorted { $0.value > $1.value }

let top3 = sortedFrequency.prefix(3)

print("Text: \(text)\n")
print("Letter frequencies:")
for (char, count) in sortedFrequency {
    print("\(char): \(count)")
}

print("\nTop 3 most frequent letters:")
for (char, count) in top3 {
    print("\(char): \(count)")
}

//: [Next](@next)
