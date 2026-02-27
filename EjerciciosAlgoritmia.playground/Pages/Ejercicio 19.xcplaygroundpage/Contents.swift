//: [Previous](@previous)

import Foundation

/*: Crea una función que, dada una cadena de texto, devuelva un diccionario con la frecuencia de cada palabra, ordenado descendentemente por frecuencia. */

func frecuenciaPalabrasOrdenadas(en texto: String) -> [(
    palabra: String, frecuencia: Int
)] {

    let palabras =
        texto
        .lowercased()
        .components(separatedBy: CharacterSet.alphanumerics.inverted)
        .filter { !$0.isEmpty }

    // Contamos la frecuencia de cada palabra
    let frecuencias = palabras.reduce(into: [String: Int]()) {
        contador,
        palabra in
        contador[palabra, default: 0] += 1
    }

    // Ordenamos descendentemente por frecuencia
    let ordenadas = frecuencias.sorted { $0.value > $1.value }

    return ordenadas.map { (palabra: $0.key, frecuencia: $0.value) }
}

let texto = "Hola hola soy Diana Diana Diana."
let resultado = frecuenciaPalabrasOrdenadas(en: texto)

print(resultado)

//: [Next](@next)
