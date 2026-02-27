//: [Previous](@previous)

import Foundation

/*: Define una función llamada intercambiar que reciba dos variables (inout) y las intercambie. Crea una versión para datos Int y otra String. */

// Versión para datos Int
func intercambiar(_ a: inout Int, _ b: inout Int) {
    let temp = a
    a = b
    b = temp
}

// Versión para datos String
func intercambiar(_ a: inout String, _ b: inout String) {
    let temp = a
    a = b
    b = temp
}

// Int
var x = 5
var y = 10
print("Antes: x = \(x), y = \(y)")
intercambiar(&x, &y)  // Usamos & para pasar por referencia
print("Después: x = \(x), y = \(y)\n")

// String
var nombre1 = "Alice"
var nombre2 = "Bob"
print("Antes: nombre1 = \(nombre1), nombre2 = \(nombre2)")
intercambiar(&nombre1, &nombre2)
print("Después: nombre1 = \(nombre1), nombre2 = \(nombre2)")

// También se podría crear una función genérica y usar tuplas para un swap atómico:
func intercambiar<T>(_ a: inout T, _ b: inout T) {
    (a, b) = (b, a)
}

// Int
var edadJuan = 25
var edadAna = 30
intercambiar(&edadJuan, &edadAna)
print("Juan: \(edadJuan), Ana: \(edadAna)") // Juan: 30, Ana: 25

// String
var ciudadA = "Madrid"
var ciudadB = "Barcelona"
intercambiar(&ciudadA, &ciudadB)
print("A: \(ciudadA), B: \(ciudadB)") // A: Barcelona, B: Madrid

//: [Next](@next)
