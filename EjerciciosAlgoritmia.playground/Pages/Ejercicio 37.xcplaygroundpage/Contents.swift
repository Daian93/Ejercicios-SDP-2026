//: [Previous](@previous)

import Foundation

/*: Define una estructura simple de lista enlazada y escribe una función recursiva para invertirla.
 Una lista enlazada es una estructura de datos donde cada elemento (nodo) contiene un valor y un puntero (referencia) al siguiente nodo. */

class Nodo<T> {
    var valor: T
    var siguiente: Nodo?

    init(valor: T, siguiente: Nodo? = nil) {
        self.valor = valor
        self.siguiente = siguiente
    }
}

class ListaEnlazada<T> {
    var cabeza: Nodo<T>?

    init() {}

    // Método para agregar al final.
    func agregar(valor: T) {
        let nuevoNodo = Nodo(valor: valor)
        if let cabeza = cabeza {
            var actual = cabeza
            while let next = actual.siguiente {
                actual = next
            }
            actual.siguiente = nuevoNodo
        } else {
            cabeza = nuevoNodo
        }
    }

    // Método para imprimir la lista.
    func imprimir() {
        var actual = cabeza
        var valores: [T] = []
        while let nodo = actual {
            valores.append(nodo.valor)
            actual = nodo.siguiente
        }
        print(valores)
    }
}

func invertirLista<T>(_ nodo: Nodo<T>?) -> Nodo<T>? {
    // Caso base: lista vacía o un solo nodo.
    guard let nodo = nodo, let siguiente = nodo.siguiente else {
        return nodo
    }

    // Llamada recursiva para invertir el resto.
    let nuevaCabeza = invertirLista(siguiente)

    // Invertir el enlace.
    siguiente.siguiente = nodo
    nodo.siguiente = nil

    return nuevaCabeza
}

let lista = ListaEnlazada<Int>()
lista.agregar(valor: 1)
lista.agregar(valor: 2)
lista.agregar(valor: 3)
lista.agregar(valor: 4)

print("Lista original:")
lista.imprimir()

lista.cabeza = invertirLista(lista.cabeza)

print("Lista invertida:")
lista.imprimir()

//: [Next](@next)
