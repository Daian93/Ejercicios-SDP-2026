//: [Previous](@previous)

import Foundation

/*: Define un struct llamado Circulo con una propiedad para el radio. Agrega dos propiedades calculadas: una que calcule el área y otra la circunferencia. Instancia varios círculos y determina cuál tiene mayor área y cuál menor. */

struct Circulo {
    let radio: Double
    var area: Double {
        .pi * pow(radio, 2)
    }
    var circunferencia: Double {
        2 * .pi * radio
    }
}

let circulos: [Circulo] = [
    Circulo(radio: 3),
    Circulo(radio: 4),
    Circulo(radio: 5),
]

if let circuloMayorArea = circulos.max(by: { $0.area < $1.area }) {
    print("El círculo con mayor área tiene un área de \(circuloMayorArea.area)")
}

if let circuloMenorArea = circulos.min(by: { $0.area < $1.area }) {
    print("El círculo con menor área tiene un área de \(circuloMenorArea.area)")
}

//: [Next](@next)
