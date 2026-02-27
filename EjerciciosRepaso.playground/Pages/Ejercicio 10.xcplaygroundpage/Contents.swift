//: [Previous](@previous)

import Foundation

/*: Diseña una clase Pelicula con propiedades título, director y estreno. Implementa un método que devuelva una cadena con una descripción completa. Además, crea dos funciones: una que compare si dos películas tienen el mismo director y otra que verifique si pertenecen a la misma década. */

class Pelicula {
    let titulo: String
    let director: String
    let estreno: Int

    init(titulo: String, director: String, estreno: Int) {
        self.titulo = titulo
        self.director = director
        self.estreno = estreno
    }

    func descripcion() -> String {
        return "\(titulo), dirigida por \(director), estrenada en \(estreno)."
    }

    func mismoDirector(pelicula: Pelicula) -> Bool {
        return self.director == pelicula.director
    }

    func mismaDecada(pelicula: Pelicula) -> Bool {
        return (self.estreno / 10) == (pelicula.estreno / 10)
    }
}

let p1 = Pelicula(
    titulo: "Inception",
    director: "Christopher Nolan",
    estreno: 2010
)
let p2 = Pelicula(
    titulo: "Interstellar",
    director: "Christopher Nolan",
    estreno: 2014
)

print(p1.descripcion())
print(p2.descripcion())

print(p1.mismoDirector(pelicula: p2))
print(p1.mismaDecada(pelicula: p2))

//: [Next](@next)
