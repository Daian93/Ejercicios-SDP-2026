//: [Previous](@previous)

import Foundation

/*: Dado un array de enteros, encuentra la subsecuencia creciente más larga. Tendrás que explicar por pasos cómo lo has conseguido. */

/* La idea del algoritmo resumidamente sería la siguiente:
 1. Para cada posición 'i', calculamos la longitud de la LIS que termina en 'i'.
 2. Inicialmente, cada número por sí solo es subsecuencia creciente de longitud 1.
 3. Para cada elemento 'i', revisamos todos los anteriores j < i.
 4. Si array[j] < array[i], entonces podemos extender la subsecuencia de j.
 5. Nos quedamos con la mejor opción.
 6. Guardamos también el índice anterior para poder reconstruir la subsecuencia final.
 */

func subsecuenciaCrecienteMasLarga(_ nums: [Int]) -> [Int] {
    // Si el array está vacío, no hay subsecuencia y salimos devolviendo [].
    guard !nums.isEmpty else { return [] }

    /*Se definen estructuras auxiliares. longitudes[i] indica la longitud de la subsecuencia creciente más larga que termina en 'i'. Se inicia en 1 porque cada número por sí solo es una subsecuencia. Luego, anterior[i] guarda el índice del número anterior en la subsecuencia para reconstruirla luego. */
    let n = nums.count
    var longitudes = Array(repeating: 1, count: n)
    var anterior = Array(repeating: -1, count: n)

    // maxLongitud es la longitud máxima encontrada hasta ahora e indiceFinal es el índice donde termina esa subsecuencia máxima.
    var maxLongitud = 1
    var indiceFinal = 0

    // 'i' recorre cada elemento y 'j' recorre todos los anteriores a 'i'. Comparamos nums[i] con nums[j].
    for i in 0..<n {
        for j in 0..<i {
            // Aquí preguntamos si nums[j] es menor que nums[i]. Si es así, entonces podemos formar una subsecuencia creciente.
            if nums[j] < nums[i] && longitudes[j] + 1 > longitudes[i] {
                // Posteriormente, actualizamos la mejor longitud que termina en 'i' y guardamos que el elemento anterior es 'j'.
                longitudes[i] = longitudes[j] + 1
                anterior[i] = j
            }
        }

        // Si la subsecuencia que termina en i es la más larga hasta ahora, actualizamos maxLongitud y guardamos dónde termina (indiceFinal).
        if longitudes[i] > maxLongitud {
            maxLongitud = longitudes[i]
            indiceFinal = i
        }
    }

    // Reconstrucción de la subsecuencia
    var resultado: [Int] = []
    var i = indiceFinal

    // Recorremos hacia atrás. Añadimos el elemento actual, saltamos al índice anterior y repetimos hasta llegar a -1.
    while i != -1 {
        resultado.append(nums[i])
        i = anterior[i]
    }

    // Invertimos el array para devolver correctamente.
    return resultado.reversed()
}

let numeros = [10, 9, 2, 5, 3, 7, 101, 18]
let lis = subsecuenciaCrecienteMasLarga(numeros)
print(lis)

//: [Next](@next)
