//: [Previous](@previous)

import Foundation

/*: Crea una función que intente leer el contenido de un archivo de texto (simulado) y retorne su contenido. Implementa el manejo de errores con una enumeración para capturar la situación en que el archivo no existe o se produce otro error. */

enum ArchivoError: Error {
    case archivoNoExiste
    case errorDesconocido
}

func leerArchivoSimulado(nombre: String) throws -> String {
    let archivosSimulados: [String: String] = [
        "hola.txt": "¡Hola! Este es el contenido del archivo hola.txt",
        "datos.txt": "Datos importantes del sistema",
    ]

    // Simulamos error aleatorio
    if Int.random(in: 1...10) == 1 {
        throw ArchivoError.errorDesconocido
    }

    if let contenido = archivosSimulados[nombre] {
        return contenido
    } else {
        throw ArchivoError.archivoNoExiste
    }
}

let nombresDePrueba = ["hola.txt", "datos.txt", "inexistente.txt"]

for nombre in nombresDePrueba {
    do {
        let contenido = try leerArchivoSimulado(nombre: nombre)
        print("Contenido de \(nombre): \(contenido).")
    } catch ArchivoError.archivoNoExiste {
        print("Error: El archivo \(nombre) no existe.")
    } catch ArchivoError.errorDesconocido {
        print("Error: Ocurrió un error desconocido al leer \(nombre).")
    } catch {
        print("Error inesperado al leer \(nombre)")
    }
}

//: [Next](@next)
