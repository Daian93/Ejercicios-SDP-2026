//: [Previous](@previous)

import Foundation

/*: En la clase Pelicula, incorpora un método reproducir que reciba un objeto de tipo Usuario (crea este tipo con propiedades como nombre y edad) y muestre un mensaje indicando que la película se está reproduciendo para dicho usuario. */

// Primero definimos el tipo Usuario con un struct:
class Usuario {
    let nombre: String
    let edad: Int
    
    init(nombre: String, edad: Int) {
        self.nombre = nombre
        self.edad = edad
    }
}

// Recuperamos la clase Pelicula del ejercicio 10 y añadimos el nuevo método
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

    func reproducir(para usuario: Usuario) {
        print("La película \(titulo) se está reproduciendo para \(usuario.nombre)")
    }
}

let pelicula = Pelicula(
    titulo: "Avengers: Endgame",
    director: "Anthony and Joe Russo",
    estreno: 2019
)
let usuario = Usuario(nombre: "Mario", edad: 35)

pelicula.reproducir(para: usuario)

//: [Next](@next)
