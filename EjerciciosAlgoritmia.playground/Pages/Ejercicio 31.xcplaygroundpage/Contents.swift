//: [Previous](@previous)

import Foundation

/*: Diseña una función que verifique si un número es de Armstrong, utilizando reduce para sumar los dígitos elevados a la potencia correspondiente.
 N= m∑i=1 dm^i.
 Si el número es igual a la suma de sus dígitos elevados a la potencia del número de dígitos del número.*/

func esArmstrong(_ numero: Int) -> Bool {
    // Primero convertimos el número en un array de dígitos.
    let digitos = String(numero).compactMap { Int(String($0)) }
    let potencia = digitos.count

    // Se eleva cada uno al número de dígitos y se suman usando 'reduce'.
    let suma = digitos.reduce(0) { acumulado, digito in
        acumulado + Int(pow(Double(digito), Double(potencia)))
    }

    // El número es de Armstrong si la suma coincide con el valor original.
    return suma == numero
}

print(esArmstrong(153))  // true
print(esArmstrong(370))  // true
print(esArmstrong(123))  // false

//: [Next](@next)
