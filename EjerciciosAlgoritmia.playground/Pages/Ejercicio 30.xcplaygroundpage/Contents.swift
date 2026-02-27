//: [Previous](@previous)

import Foundation

/*: Implementa un cifrado César (con desplazamiento definido) aplicando métodos de mapeo sobre los caracteres.
 Cifrado:E(x) = (x + k) mod 26, Descifrado: D (x) = (x − k) mod 26. */

func cifrarCesar(_ texto: String, desplazamiento k: Int) -> String {
    let desplazamiento = k % 26  // Por si k > 26

    return String(
        texto.lowercased().map { caracter in
            guard let ascii = caracter.asciiValue,
                ascii >= 97 && ascii <= 122
            else {
                return caracter  // Si no se trata de una letra se deja igual
            }

            let x = Int(ascii - 97)
            let cifrado = (x + desplazamiento) % 26
            return Character(UnicodeScalar(cifrado + 97)!)
        }
    )
}

func descifrarCesar(_ texto: String, desplazamiento k: Int) -> String {
    let desplazamiento = k % 26

    return String(
        texto.lowercased().map { caracter in
            guard let ascii = caracter.asciiValue,
                ascii >= 97 && ascii <= 122
            else {
                return caracter
            }

            let x = Int(ascii - 97)
            let descifrado = (x - desplazamiento) % 26
            return Character(UnicodeScalar(descifrado + 97)!)
        }
    )
}

let mensaje = "Me llamo Diana"
let cifrado = cifrarCesar(mensaje, desplazamiento: 5)
print(cifrado)

let original = descifrarCesar(cifrado, desplazamiento: 5)
print(original)

//: [Next](@next)
