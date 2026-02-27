//: [Previous](@previous)

import Foundation

/*: Define un struct llamado Vector con propiedades x e y. Agrega un método que permita desplazar el vector sumándole valores delta para cada componente. Crea un vector, aplícale el desplazamiento y muestra los resultados. */

struct Vector {
    var x: Double
    var y: Double

    // El método es mutating porque modifica las propiedades del propio struct.
    mutating func desplazar(deltaX: Double, deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }
}

var vector = Vector(x: 3.0, y: 4.0)
print("Vector inicial: (\(vector.x), \(vector.y))")
vector.desplazar(deltaX: 1.5, deltaY: -1.0)
print("Vector desplazado: (\(vector.x), \(vector.y))")

//: [Next](@next)
