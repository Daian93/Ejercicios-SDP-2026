//: [Previous](@previous)

import Foundation

/*: Desarrolla una función que convierta un número entero (de 1 y 3999) en números romanos. Asegúrate de manejar correctamente los casos especiales de sustracción (por ejemplo, 4 como IV, 9 como IX, etc.). */

func enteroARomano(_ numero: Int) -> String {
    guard numero > 0 && numero < 4000 else {
        return "Número fuera de rango (1-3999)"
    }

    // Diccionario de valores romanos en orden descendente
    let valores: [(romano: String, entero: Int)] = [
        ("M", 1000),
        ("CM", 900),
        ("D", 500),
        ("CD", 400),
        ("C", 100),
        ("XC", 90),
        ("L", 50),
        ("XL", 40),
        ("X", 10),
        ("IX", 9),
        ("V", 5),
        ("IV", 4),
        ("I", 1)
    ]

    var resultado = ""
    var numeroRestante = numero

    for (romano, entero) in valores {
        while numeroRestante >= entero {
            resultado += romano
            numeroRestante -= entero
        }
    }

    return resultado
}

// Comprobamos imprimiendo ejemplos
print(enteroARomano(1))    // I
print(enteroARomano(4))    // IV
print(enteroARomano(9))    // IX
print(enteroARomano(58))   // LVIII
print(enteroARomano(1994)) // MCMXCIV
print(enteroARomano(3999)) // MMMCMXCIX

//: [Next](@next)
