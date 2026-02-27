//: [Previous](@previous)

import Foundation

/*: Escribe un programa que guarde varios tipos de alimentos y su precio por kilo en un diccionario. Cree una forma para mostrar qué precio tendría cualquiera de los productos al indicar un número de kilos específico. */

// Dictionary with food and price per kilo
let foodPrices: [String: Double] = [
    "Apples": 2.50,
    "Bananas": 1.80,
    "Rice": 1.20,
    "Chicken": 6.75,
    "Salmon": 12.40,
]

let selectedFood = "Chicken"
let kilos = 2.5

// Calculate total price
if let pricePerKilo = foodPrices[selectedFood] {
    let totalPrice = pricePerKilo * kilos

    print("Product: \(selectedFood)")
    print("Price per kilo: \(pricePerKilo)")
    print("Kilos: \(kilos)")
    print("Total price: \(totalPrice)")
} else {
    print("Product not found in dictionary.")
}

//: [Next](@next)
