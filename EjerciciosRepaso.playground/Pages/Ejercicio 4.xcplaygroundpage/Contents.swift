//: [Previous](@previous)

import Foundation

/*: Implementa dos bucles distintos: uno con for-in y otro con repeat-while, que muestren en consola todos los números pares entre 2 y 40. Comenta las diferencias en la sintaxis y el flujo de ejecución. */

// Empezamos por el bucle FOR-IN: éste es más compacto y declarativo. El rango 2...40 ya define inicio y fin y la condición 'where' filtra solo los pares. Además, evalúa el rango antes de empezar y ejecuta el bloque si solo hay elementos.

for i in 2...40 where i.isMultiple(of: 2) {
    print(i)
}

// Otra forma mejor de hacer el bucle for-in sería utilizando 'stride' ya que se trata de una secuencia que no va seguida, es decir, vamos saltando de 2 en 2. Usaremos 'through' para que se incluya el último valor:

for i in stride(from: 2, through: 40, by: 2) {
    print(i)
}

// Continuamos con el bucle REPEAT-WHILE: es más verboso y requiere una variable de control, incremento manual y condición al final. Además, ejecuta el bloque al menos una vez y evalúa la concidión después del bloque.

var i: Int = 2
repeat {
    print(i)
    i += 2
} while i <= 40

//: [Next](@next)
