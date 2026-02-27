//: [Previous](@previous)

import Foundation

/*: Modela un sistema para una fábrica de café utilizando clases. La clase principal Cafetera debe preparar tazas de café con una cantidad aleatoria de cafeína. Cada taza puede ser de expreso, americano o capuchino, y en ocasiones incluirá una muestra de un nuevo sabor. Simula el proceso de preparación. */

enum TipoCafe: String {
    case expreso = "Expreso"
    case americano = "Americano"
    case capuchino = "Capuchino"
}

class TazaCafe {
    let tipo: TipoCafe
    let cafeina: Int
    let tieneMuestraNuevoSabor: Bool

    init(tipo: TipoCafe, cafeina: Int, tieneMuestraNuevoSabor: Bool) {
        self.tipo = tipo
        self.cafeina = cafeina
        self.tieneMuestraNuevoSabor = tieneMuestraNuevoSabor
    }

    func descripcion() -> String {
        var mensaje = "\(tipo.rawValue) con \(cafeina) mg de cafeína"
        if tieneMuestraNuevoSabor {
            mensaje += " + muestra de nuevo sabor."
        }
        return mensaje
    }
}

class Cafetera {
    func prepararCafe() -> TazaCafe {
        // Tipo de café aleatorio
        let tipos: [TipoCafe] = [.expreso, .americano, .capuchino]
        let tipoAleatorio = tipos.randomElement()!

        // Cantidad aleatoria de cafeína (mg)
        let cafeinaAleatoria = Int.random(in: 50...200)

        // Baja probabilidad de incluir muestra de nuevo sabor
        let incluyeMuestra = Bool.random() && Bool.random()

        return TazaCafe(
            tipo: tipoAleatorio,
            cafeina: cafeinaAleatoria,
            tieneMuestraNuevoSabor: incluyeMuestra
        )
    }
}

// Se observa que la cafetera prepara distintos tipos de café de forma aleatoria. Cada taza tiene una cantidad variable de cafeína y, ocasionalmente, incluye una muestra de un nuevo sabor.
let cafetera = Cafetera()

print("Iniciando producción de café...\n")

for i in 1...5 {
    let taza = cafetera.prepararCafe()
    print("Taza \(i): \(taza.descripcion())")
}

//: [Next](@next)
