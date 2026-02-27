//: [Previous](@previous)

import Foundation

/*: En la clase Vehiculo, añade una propiedad configuracionDetallada declarada como lazy, que realice una operación costosa (por ejemplo, concatenar información de múltiples propiedades) y se inicialice solo al primer acceso. Muestra cómo y cuándo se crea. */

// Recuperamos la clase Vehiculo del ejercicio 18 y aádimos una propiedad configuracionDetallada:
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

    lazy var configuracionDetallada: String = {
        print("Inicializando configuracionDetallada (operación costosa)...")
        let detalles = """
            Marca: \(marca)
            Modelo: \(modelo)
            Año: \(año)
            """
        return detalles
    }()
}

let coche = Vehiculo(marca: "Toyota", modelo: "Corolla", año: 2022)
print("\nAccediendo a otras propiedades:")
coche.arrancar()  // Esto no inicializa la propiedad lazy

print("\nAccediendo a la configuracionDetallada por primera vez:")
print(coche.configuracionDetallada)  // Aquí se inicializa por primera vez

print("\nAccediendo a la configuracionDetallada nuevamente:")
print(coche.configuracionDetallada)  // Ya no se inicializa otra vez, se reutiliza el valor

//: [Next](@next)
