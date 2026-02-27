//: [Previous](@previous)

import Foundation

/*: Define una función filtrarVectores que, dado un array de Vector y un valor límite de magnitud, retorne un array con aquellos vectores cuya magnitud sea menor o igual al límite. */

// Recuperamos la estructura de Vector creada en el ejercicio 16:
struct Vector {
    var x: Double
    var y: Double

    mutating func desplazar(deltaX: Double, deltaY: Double) {
        self.x += deltaX
        self.y += deltaY
    }

    func magnitud() -> Double {
        return sqrt(x * x + y * y)
    }

    func distancia(a otroVector: Vector) -> Double {
        let dx = self.x - otroVector.x
        let dy = self.y - otroVector.y
        let diferencia = Vector(x: dx, y: dy)
        return diferencia.magnitud()
    }
}

func filtrarVectores(_ vectores: [Vector], limite: Double) -> [Vector] {
    return vectores.filter { $0.magnitud() <= limite }
}

let vectores = [
    Vector(x: 3, y: 4),   // magnitud = 5
    Vector(x: 1, y: 1),   // magnitud ≈ 1.41
    Vector(x: 6, y: 8),   // magnitud = 10
    Vector(x: 0, y: 2)    // magnitud = 2
]

let resultado = filtrarVectores(vectores, limite: 5)

print("Vectores con magnitud ≤ 5:")
for v in resultado {
    print("(\(v.x), \(v.y)) -> magnitud: \(v.magnitud())")
}

//: [Next](@next)
