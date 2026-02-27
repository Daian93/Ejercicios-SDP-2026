//: [Previous](@previous)

import Foundation

/*: Para la clase CarritoDeCompras, implementa un método mostrarResumen que imprima en consola el listado de items junto con el total de la compra. Simula la adición y eliminación de items y observa cómo cambia el resumen. */

// Recuperamos la clase CarritoDeCompras desde el ejercicio 13 e implementamos el nuevo método:
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
}

let carrito = CarritoDeCompras()
carrito.mostrarResumen()
// El carrito está vacío: no hay items y el total es 0.00€

carrito.agregarItem(nombre: "Manzana", precio: 0.5)
carrito.agregarItem(nombre: "Pera", precio: 0.75)
carrito.mostrarResumen()
// Se agregan dos items:
// - Manzana: 0.50€
// - Pera: 0.75€
// Total actualizado: 1.25€

carrito.eliminarItem(nombre: "Manzana")
carrito.mostrarResumen()
// Se elimina la Manzana:
// - Solo queda Pera: 0.75€
// Total actualizado: 0.75€


carrito.agregarItem(nombre: "Banana", precio: 0.85)
carrito.mostrarResumen()
// Se agrega Banana:
// - Pera: 0.75€
// - Banana: 0.85€
// Total actualizado: 1.60€

//: [Next](@next)
