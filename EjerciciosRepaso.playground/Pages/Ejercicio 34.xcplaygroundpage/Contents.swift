//: [Previous](@previous)

import Foundation

/*: Define una enumeración Resultado con dos casos: éxito (que tenga un valor asociado de tipo String) y error (con un valor asociado de tipo Error). Crea una función que retorne un Resultado y utiliza un switch para manejar cada caso. */

enum Resultado {
    case exito(String)
    case error(Error)
}

enum MiError: Error {
    case divisionPorCero
    case numeroNegativo
}

func procesarNumero(_ numero: Int) -> Resultado {
    if numero < 0 {
        return .error(MiError.numeroNegativo)
    } else if numero == 0 {
        return .error(MiError.divisionPorCero)
    } else {
        return .exito("El número \(numero) es válido y procesado correctamente.")
    }
}

func manejarResultado(_ resultado: Resultado) {
    switch resultado {
    case .exito(let mensaje):
        print("Éxito: \(mensaje)")
    case .error(let error):
        print("Error: \(error)")
    }
}

let r1 = procesarNumero(10)
let r2 = procesarNumero(0)
let r3 = procesarNumero(-5)

manejarResultado(r1)  // El número 10 es válido y procesado correctamente
manejarResultado(r2)  // Error: divisionPorCero
manejarResultado(r3)  // Error: numeroNegativo

//: [Next](@next)
