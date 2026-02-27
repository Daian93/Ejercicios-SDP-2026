//: [Previous](@previous)

import Foundation

/*: En el struct Circulo del ejercicio 9, utiliza una propiedad calculada para obtener la circunferencia. Luego, crea una función que reciba un array de círculos y devuelva la suma total de sus áreas. */

// Recuperamos el struct Circulo del ejercicio 9 y creamos la función que se nos pide en el enunciado:
struct Circulo {
    let radio: Double
    
    var area: Double {
        .pi * pow(radio, 2)
    }
    var circunferencia: Double {
        2 * .pi * radio
    }
    
    // Utilizamos un método static porque la suma de áreas es una operación que pertenece al tipo Circulo y no depende de una instancia concreta. 
    static func sumaDeAreas(deCirculos circulos: [Circulo]) -> Double {
        return circulos.reduce(0) { $0 + $1.area }
    }
}

let circulos: [Circulo] = [
    Circulo(radio: 3),
    Circulo(radio: 4),
    Circulo(radio: 5)
]

print("La suma de las áreas de los círculos es: \(Circulo.sumaDeAreas(deCirculos: circulos))")

//: [Next](@next)
