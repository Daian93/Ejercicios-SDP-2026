//: [Previous](@previous)

import Foundation

/*: A la estructura Vector del ejercicio 12, agrega un método que calcule la magnitud (norma) y otro que, recibiendo otro vector, determine la distancia entre ambos. Crea dos instancias y muestra el resultado de la distancia. */

// Primero, recuperamos la estructura Vector y agregamos los dos métodos que nos piden:
struct Vector {
    var x: Double
    var y: Double

    mutating func desplazar(deltaX: Double, deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }

    // Calcula la magnitud (norma) del vector
    func magnitud() -> Double {
        return sqrt(x * x + y * y)
    }

    // Calcula la distancia entre dos vectores
    func distancia(a otroVector: Vector) -> Double {
        let dx = self.x - otroVector.x
        let dy = self.y - otroVector.y
        let diferencia = Vector(x: dx, y: dy)
        return diferencia.magnitud()
    }
}

let v1 = Vector(x: 3, y: 4)
let v2 = Vector(x: 1, y: 2)

print("Distancia entre v1 y v2: \(v1.distancia(a: v2))")

//: [Next](@next)
