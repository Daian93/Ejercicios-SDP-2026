//: [Previous](@previous)

import Foundation

/*: Implementa un algoritmo de cifrado César para encriptar un mensaje.
 ALGORITMO: El cifrado César desplaza cada letra del alfabeto un número fijo de posiciones. Por ejemplo, con un desplazamiento de 3, 'A' se convierte en 'D', 'B' en 'E', etc. */

let message = "My name is Diana."
let shift = 3

// Function to encrypt using Caesar cipher
func caesarCipher(_ text: String, shift: Int) -> String {
    var encrypted = ""

    for char in text {
        if char.isUppercase {
            let ascii = Int(char.asciiValue!)
            let shifted = (ascii - 65 + shift) % 26
            let newAscii = UInt8(shifted + 65)
            encrypted.append(Character(UnicodeScalar(newAscii)))

        } else if char.isLowercase {
            let ascii = Int(char.asciiValue!)
            let shifted = (ascii - 97 + shift) % 26
            let newAscii = UInt8(shifted + 97)
            encrypted.append(Character(UnicodeScalar(newAscii)))

        } else {
            encrypted.append(char)  // keep non-letters unchanged
        }
    }

    return encrypted
}

let encryptedMessage = caesarCipher(message, shift: shift)

print("Original message: \(message)")
print("Encrypted message: \(encryptedMessage)")

//: [Next](@next)
