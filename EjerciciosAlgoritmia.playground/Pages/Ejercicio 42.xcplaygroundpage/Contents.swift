//: [Previous](@previous)

import Foundation

/*: Crea una función que genere todas las combinaciones válidas de n pares de paréntesis, utilizando técnicas de backtracking recursivo.
 Número de combinaciones= Cn =  1 / n + 1 (2n n). Es similar al número Catalán. */

func generarParentesis(_ n: Int) -> [String] {
    var resultado: [String] = []
    
    // Función interna recursiva de backtracking.
    func backtrack(_ current: String, _ abiertos: Int, _ cerrados: Int) {
        // Caso base: cuando la longitud de la cadena es 2 * n, agregamos al resultado.
        if current.count == 2 * n {
            resultado.append(current)
            return
        }
        
        // Si aún podemos agregar un paréntesis abierto.
        if abiertos < n {
            backtrack(current + "(", abiertos + 1, cerrados)
        }
        
        // Si podemos agregar un paréntesis cerrado (solo si hay más abiertos que cerrados).
        if cerrados < abiertos {
            backtrack(current + ")", abiertos, cerrados + 1)
        }
    }
    
    // Iniciamos la recursión.
    backtrack("", 0, 0)
    return resultado
}

let combinaciones = generarParentesis(2)
print(combinaciones) // ["(())", "()()"]


//: [Next](@next)
