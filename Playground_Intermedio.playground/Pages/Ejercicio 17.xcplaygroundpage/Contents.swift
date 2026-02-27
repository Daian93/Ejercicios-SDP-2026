//: [Previous](@previous)

import Foundation

/* Create an algorithm to play “guess the number.” User A will choose a number between 1 and 100, and then user B will have to try different numbers until they find the one chosen by A, ending the game. They must report how many attempts it took to guess the number.
 */

// This version is with a fixed number and then increase the number one by one.
let chosenNumber = 42

var attempts = 0

for guess in 1...100 {
    attempts += 1

    if guess == chosenNumber {
        break
    }
}

print("The number was \(chosenNumber).")
print("Guessed in \(attempts) attempts.")

// Random version
let chosenNumber2 = 37

var guess2 = 0
var attempts2 = 0

repeat {
    guess2 = Int.random(in: 1...100)
    attempts2 += 1
} while guess2 != chosenNumber2

print("The number was \(chosenNumber2).")
print("Guessed in \(attempts2) attempts.")

//: [Next](@next)
