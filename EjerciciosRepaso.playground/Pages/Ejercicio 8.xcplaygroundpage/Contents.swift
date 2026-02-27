//: [Previous](@previous)

import Foundation

/*: Crea una clase denominada Vehiculo con propiedades como marca, modelo y año. Instancia 5 objetos de esta clase y añade un método que imprima una descripción completa del vehículo. */

class Vehiculo {
    let marca: String
    let modelo: String
    let año: Int

    init(marca: String, modelo: String, año: Int) {
        self.marca = marca
        self.modelo = modelo
        self.año = año
    }

    func descripcion() {
        print("Vehículo: \(marca) \(modelo), Año: \(año)")
    }
}

var coche1 = Vehiculo(marca: "Toyota", modelo: "Corolla", año: 2018)
var coche2 = Vehiculo(marca: "Honda", modelo: "Civic", año: 2019)
var coche3 = Vehiculo(marca: "Ford", modelo: "Mustang", año: 2020)
var coche4 = Vehiculo(marca: "Chevrolet", modelo: "Equinox", año: 2017)
var coche5 = Vehiculo(marca: "Nissan", modelo: "Leaf", año: 2021)

coche1.descripcion()
coche2.descripcion()
coche3.descripcion()
coche4.descripcion()
coche5.descripcion()

//: [Next](@next)
