//: [Previous](@previous)

import Foundation

/*: Construye un diccionario que almacene 8 nombres junto con la altura (en centímetros) de cada persona. Recorre el diccionario para identificar quién es la persona más alta y quién la más baja, e imprime sus datos. */

let dictionary: [String: Int] = [
    "Ana": 160, "Luis": 150, "Sofía": 170, "María": 165, "José": 180,
    "Carmen": 140, "Pedro": 175, "Isabel": 168,
]

var maxHeight: Int = 0
var minHeight: Int = 300

var maxName: String = ""
var minName: String = ""

for (name, height) in dictionary {
    if height > maxHeight {
        maxHeight = height
        maxName = name
    }
    if height < minHeight {
        minHeight = height
        minName = name
    }
}

print("La persona más alta es \(maxName) con \(maxHeight) cm.")
print("La persona más baja es \(minName) con \(minHeight) cm.")

//: [Next](@next)
