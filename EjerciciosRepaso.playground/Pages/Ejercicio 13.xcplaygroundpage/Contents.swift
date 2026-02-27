//: [Previous](@previous)

import Foundation

/*: Diseña una clase CarritoDeCompras con propiedades: un array de items (por ejemplo, String) y un total de tipo Double. Implementa métodos para añadir un item (recibiendo también su precio) y para eliminarlo,actualizando el total. Asegúrate de que el total nunca sea negativo. */

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
}

let carrito = CarritoDeCompras()
carrito.agregarItem(nombre: "Manzana", precio: 0.5)
carrito.agregarItem(nombre: "Pera", precio: 0.75)

print("Items:", carrito.items)
print("Total: \(carrito.total)")

carrito.eliminarItem(nombre: "Manzana")

print("Items tras eliminar:", carrito.items)
print("Total actualizado: \(carrito.total)")

//: [Next](@next)
