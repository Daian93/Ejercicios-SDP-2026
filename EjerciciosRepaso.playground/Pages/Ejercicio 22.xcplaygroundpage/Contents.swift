//: [Previous](@previous)

import Foundation

/*: En la clase CarritoDeCompras, implementa un método aplicarDescuento que reciba un porcentaje y reduzca el total en esa proporción, controlando que el total no baje de cero. Realiza pruebas aplicando descuentos sucesivos. */

// Recuperamos la clase CarritoDeCompras del ejercicio 17 e implementamos el método 'aplicarDescuento'
class CarritoDeCompras {
    private(set) var items: [(nombre: String, precio: Double)]
    private(set) var total: Double

    init() {
        self.items = []
        self.total = 0.0
    }

    func agregarItem(nombre: String, precio: Double) {
        guard precio >= 0 else {
            print("El precio no puede ser negativo.")
            return
        }

        items.append((nombre: nombre, precio: precio))
        total += precio
    }

    func eliminarItem(nombre: String) {
        if let index = items.firstIndex(where: { $0.nombre == nombre }) {
            let precio = items[index].precio
            items.remove(at: index)
            total -= precio
        } else {
            print("El item '\(nombre)' no existe en el carrito")
        }
    }

    func mostrarResumen() {
        print("Resumen de la compra:")
        if items.isEmpty {
            print("El carrito está vacío.")
        } else {
            for item in items {
                print("- \(item.nombre): \(String(format: "%.2f", item.precio))€")
            }
        }
        print("Total: \(String(format: "%.2f", total))€")
    }
    
    func aplicarDescuento(_ porcentaje: Double) {
        let descuento = total * (porcentaje / 100)
        // Nos aseguramos que el total nunca será menor de 0 euros.
        total = max(0, total - descuento)
    }
}

let carrito = CarritoDeCompras()
carrito.agregarItem(nombre: "Manzana", precio: 0.5)
carrito.agregarItem(nombre: "Pera", precio: 0.75)
print(carrito.total)

carrito.aplicarDescuento(75.25)
print(carrito.total)

carrito.aplicarDescuento(25.5)
print(carrito.total)

carrito.aplicarDescuento(45.75)
print(carrito.total)

carrito.aplicarDescuento(105.25) // Controlamos que el total no baja de 0.
print(carrito.total)


//: [Next](@next)
