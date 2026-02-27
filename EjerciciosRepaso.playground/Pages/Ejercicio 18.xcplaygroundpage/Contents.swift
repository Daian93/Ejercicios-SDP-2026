//: [Previous](@previous)

import Foundation

/*: En la clase Vehiculo, añade un método actualizarAño que incremente la propiedad año en uno (simulando un “año nuevo” para el vehículo). Instancia un objeto y prueba este comportamiento. */

// Recuperamos la clase Vehiculo del ejercicio 14 y añadimos el nuevo método:
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
    
    func actualizarAño() {
        año += 1
        print("Año actualizado.")
    }
}

var coche = Vehiculo(marca: "Toyota", modelo: "Corolla", año: 2020)
coche.descripcion()

coche.actualizarAño()
coche.descripcion() // Observamos que se ha incrementado el año en uno y ahora es 2021.

//: [Next](@next)
