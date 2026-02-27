//: [Previous](@previous)

import Foundation

/*: Crea una clase Contador con una propiedad valor de tipo Int. Añade observadores (willSet y didSet) para imprimir un mensaje cada vez que el valor cambie, y simula varios cambios en el contador. */

class Contador {
    var valor: Int = 0 {
        willSet(nuevoValor) {
            print("Se va a cambiar el valor de \(valor) a \(nuevoValor)")
        }
        didSet {
            print("El valor ha cambiado de \(oldValue) a \(valor)\n")
        }
    }

    init(valorInicial: Int = 0) {
        self.valor = valorInicial
        print("Contador inicializado con valor \(valor)\n")
    }
}

let contador = Contador(valorInicial: 5)

contador.valor = 10
contador.valor = 15
contador.valor = 7
contador.valor += 3
contador.valor -= 2

//: [Next](@next)
