//: [Previous](@previous)

import Foundation

/*: Implementa una función que determine el número mínimo de monedas necesarias para dar cambio de una cantidad dada (problema del cambio de monedas).
 C (A) = {0, si A= 0,
minci≤ A{C (A− ci) + 1}, si A > 0. */

func cambioMinimo(_ cantidad: Int, monedas: [Int]) -> Int {
    // Nos aseguramos de que el cambio no sea negativo.
    guard cantidad >= 0 else { return -1 }
    
    // Array para memoización: dp[i] = mínimo número de monedas para cantidad i.
    var dp = Array(repeating: Int.max, count: cantidad + 1)
    dp[0] = 0 // Base: para 0 monedas necesitamos 0.
    
    // Iteramos sobre todas las cantidades hasta la cantidad deseada.
    for i in 1...cantidad {
        for moneda in monedas {
            if i - moneda >= 0, dp[i - moneda] != Int.max {
                dp[i] = min(dp[i], dp[i - moneda] + 1)
            }
        }
    }
    
    return dp[cantidad] == Int.max ? -1 : dp[cantidad]
}

let monedas = [1, 5, 10, 25]
let cantidad = 54
print(cambioMinimo(cantidad, monedas: monedas)) // 6 (25 + 25 + 1 + 1 + 1 + 1)


//: [Next](@next)
