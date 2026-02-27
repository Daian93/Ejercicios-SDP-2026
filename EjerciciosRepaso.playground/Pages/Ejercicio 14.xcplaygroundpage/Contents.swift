//: [Previous](@previous)

import Foundation

/*: En la clase Vehiculo del ejercicio 8, añade un método arrancar que imprima un mensaje indicando que el vehículo (mostrando marca y modelo) ha iniciado su marcha. Prueba el método con una instancia. */

// Recuperamos la clase Vehiculo del ejercicio 8 y añadimos el método arrancar:

class Vehiculo {
    let marca: String
    let modelo: String
    var año: Int

    init(marca: String, modelo: String, año: Int) {
        self.marca = marca
        self.modelo = modelo
        self.año = año
    }

    func descripcion() {
        print("Vehículo: \(marca) \(modelo), Año: \(año)")
    }
    
    func arrancar() {
        print("El \(marca) \(modelo) ha iniciado su marcha.")
    }
}

let coche = Vehiculo(marca: "Toyota", modelo: "Corolla", año: 2020)
coche.arrancar()

//: [Next](@next)
