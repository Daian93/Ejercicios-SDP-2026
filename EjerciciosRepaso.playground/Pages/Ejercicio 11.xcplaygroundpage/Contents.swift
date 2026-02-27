//: [Previous](@previous)

import Foundation

/*: Crea dos subclases de Pelicula: PeliculaDigital (añade una propiedad para la URL de transmisión) y PeliculaEnDVD (añade la duración del disco en minutos). Instancia 3 objetos de cada subclase y comprueba su comportamiento. */

// Recuperamos la clase Película del Ejercicio anterior:
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
        return "\(titulo), dirigida por \(director), estrenada en \(estreno)"
    }

    func mismoDirector(pelicula: Pelicula) -> Bool {
        return self.director == pelicula.director
    }

    func mismaDecada(pelicula: Pelicula) -> Bool {
        return (self.estreno / 10) == (pelicula.estreno / 10)
    }
}

class PeliculaDigital: Pelicula {
    var urlTransmision: String

    init(titulo: String, director: String, estreno: Int, urlTransmision: String)
    {
        self.urlTransmision = urlTransmision
        super.init(titulo: titulo, director: director, estreno: estreno)
    }

    // Sobrescribimos el método de descripción para que aparezca también la URL.
    override func descripcion() -> String {
        return super.descripcion() + ". URL: \(urlTransmision)."
    }
}

class PeliculaEnDVD: Pelicula {
    var duracionMinutos: Int

    init(titulo: String, director: String, estreno: Int, duracionMinutos: Int) {
        self.duracionMinutos = duracionMinutos
        super.init(titulo: titulo, director: director, estreno: estreno)
    }

    // Sobrescribimos el método para que aparezca también la duración.
    override func descripcion() -> String {
        return super.descripcion() + ". Duración: \(duracionMinutos) min."
    }
}

// Instanciamos 3 objetos de cada subclase:
let p1 = PeliculaDigital(
    titulo: "Inception",
    director: "Christopher Nolan",
    estreno: 2010,
    urlTransmision: "www.inception.com"
)
let p2 = PeliculaDigital(
    titulo: "The Dark Knight",
    director: "Christopher Nolan",
    estreno: 2008,
    urlTransmision: "www.darkknight.com"
)
let p3 = PeliculaDigital(
    titulo: "Interstellar",
    director: "Christopher Nolan",
    estreno: 2014,
    urlTransmision: "www.interstellar.com"
)

let p4 = PeliculaEnDVD(
    titulo: "Pulp Fiction",
    director: "Quentin Tarantino",
    estreno: 1994,
    duracionMinutos: 154
)
let p5 = PeliculaEnDVD(
    titulo: "The Shawshank Redemption",
    director: "Frank Darabont",
    estreno: 1994,
    duracionMinutos: 142
)
let p6 = PeliculaEnDVD(
    titulo: "The Godfather",
    director: "Francis Ford Coppola",
    estreno: 1972,
    duracionMinutos: 175
)

// Comprobamos el comportamiento:
print(p1.descripcion())
print(p2.descripcion())
print(p3.descripcion())
print(p4.descripcion())
print(p5.descripcion())
print(p6.descripcion())

//: [Next](@next)
