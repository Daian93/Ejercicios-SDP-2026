//: [Previous](@previous)

import Foundation

/*: Declara cuatro variables numéricas de distintos tipos (por ejemplo, Int, Double, Float y UInt). Realiza al menos 10 operaciones aritméticas combinando suma, resta, multiplicación, división y módulo, usando expresiones con paréntesis para modificar la precedencia y comentando sobre conversiones de tipo. */

// Declaramos cuatro variables numéricas de distinto tipo:

var num1: Int = 10
var num2: Double = 20.5
var num3: Float = 30.0
var num4: UInt = 40

// Ahora realizamos 10 operaciones aritméticas:

let result1 = num1 + 5  // No hay conversión porque ambos son Int.
let result2 = num2 - 10.5  // No hay conversión porque ambos operandos son Double.
let result3 = num3 * 2.0  // Swift infiere el literal como Float.
let result4 = num1 / 3  // Al ser Int / Int, el resultado es entero (se descarta el decimal).
let result5 = Double(num1) / num2  // Es necesaria la conversión porque Swift no mezcla tipos numéricos automáticamente.
let result6 = Double(num1 + 2) * num2  // Primero se suma (num1 + 2) y luego se convierte a Double.
let result7 = num2 / Double(num4 + 2)  // UInt se convierte a Double para poder dividir.
let result8 = num1 % 3  // El operador % solo funciona con enteros.
let result9 = (Double(num1) + num2) * Double(num3)  // Se convierten Int y Float a Double para operar con Double.
let result10 = num1 - Int(num4)  // Es obligatorio convertir UInt a Int explícitamente.

//: [Next](@next)
