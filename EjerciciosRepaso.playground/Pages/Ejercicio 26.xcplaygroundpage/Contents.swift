//: [Previous](@previous)

import Foundation

/*: Modela un juego: define una clase Personaje con propiedades (nombre y salud) y métodos para “morir” y “saludar”. Crea subclases como Arquero (con habilidad para disparar), Guerrero (con capacidad defensiva) y Hechicero (que puede curar). Cada uno debe implementar sus métodos de ataque o interacción, usando enumeraciones para definir tipos de acción. */

enum TipoAccion {
    case ataque
    case defensa
    case curar
    case saludar
}

class Personaje {
    let nombre: String
    var salud: Int {
        willSet {
            if newValue <= 0 {
                muerto = true
            }
        }
        didSet {
            if salud < 0 { salud = 0 }
        }
    }
    var muerto: Bool = false

    init(nombre: String, salud: Int) {
        self.nombre = nombre
        self.salud = salud
    }

    func saludar() {
        print("\(nombre) dice: ¡Hola!")
    }

    func morir() {
        if muerto {
            print("\(nombre) ha muerto.")
        }
    }

    func recibirDaño(_ cantidad: Int) {
        guard !muerto else { return }
        salud -= cantidad
        print("\(nombre) recibe \(cantidad) de daño. Salud actual: \(salud)")
        morir()
    }

    func recibirCuracion(_ cantidad: Int) {
        guard !muerto else { return }
        salud += cantidad
        print("\(nombre) recupera \(cantidad) de salud. Salud actual: \(salud)")
    }

    // Método genérico de acción
    func realizarAccion(_ accion: TipoAccion) {
        switch accion {
        case .saludar:
            saludar()
        default:
            print("\(nombre) realiza acción \(accion)")
        }
    }
}

class Arquero: Personaje {
    var flechas: Int

    init(nombre: String, salud: Int, flechas: Int) {
        self.flechas = flechas
        super.init(nombre: nombre, salud: salud)
    }

    func disparar(_ objetivo: Personaje) {
        guard flechas > 0 else {
            print("\(nombre) no tiene flechas para disparar.")
            return
        }
        guard !muerto else { return }
        flechas -= 1
        let daño = Int.random(in: 10...20)
        print("\(nombre) dispara a \(objetivo.nombre) e inflige \(daño) de daño! Flechas restantes: \(flechas).")
        objetivo.recibirDaño(daño)
    }

    override func realizarAccion(_ accion: TipoAccion) {
        switch accion {
        case .ataque:
            print("\(nombre) debe usar disparar(objetivo: Personaje) para atacar.")
        default:
            super.realizarAccion(accion)
        }
    }
}

class Guerrero: Personaje {
    var armadura: Int

    init(nombre: String, salud: Int, armadura: Int) {
        self.armadura = armadura
        super.init(nombre: nombre, salud: salud)
    }

    func defender() {
        print("\(nombre) se defiende con armadura de nivel \(armadura).")
    }

    func atacar(_ objetivo: Personaje) {
        guard !muerto else { return }
        let daño = Int.random(in: 15...25)
        print("\(nombre) ataca a \(objetivo.nombre) e inflige \(daño) de daño.")
        objetivo.recibirDaño(daño)
    }

    override func realizarAccion(_ accion: TipoAccion) {
        switch accion {
        case .defensa:
            defender()
        default:
            super.realizarAccion(accion)
        }
    }
}

class Hechicero: Personaje {
    var poder: Int

    init(nombre: String, salud: Int, poder: Int) {
        self.poder = poder
        super.init(nombre: nombre, salud: salud)
    }

    func curar(_ objetivo: Personaje) {
        guard !muerto else { return }
        objetivo.recibirCuracion(poder)
    }

    override func realizarAccion(_ accion: TipoAccion) {
        switch accion {
        case .curar:
            print("\(nombre) puede curar a un aliado con curar(objetivo: Personaje)")
        default:
            super.realizarAccion(accion)
        }
    }
}

// Simulación del juego
let arquero = Arquero(nombre: "Legolas", salud: 100, flechas: 3)
let guerrero = Guerrero(nombre: "Conan", salud: 120, armadura: 50)
let hechicero = Hechicero(nombre: "Merlín", salud: 80, poder: 30)

// Saludos
arquero.realizarAccion(.saludar)
guerrero.realizarAccion(.saludar)
hechicero.realizarAccion(.saludar)

print("\n--- Batalla ---")
// Turno 1
arquero.disparar(guerrero)
guerrero.atacar(arquero)
hechicero.curar(arquero)

// Turno 2
arquero.disparar(guerrero)
guerrero.atacar(arquero)
hechicero.curar(guerrero)

// Turno 3
arquero.disparar(guerrero)
guerrero.atacar(arquero)
hechicero.curar(arquero)

// Turno 4 (Arquero sin flechas)
arquero.disparar(guerrero)
guerrero.atacar(arquero)
hechicero.curar(guerrero)

//: [Next](@next)
