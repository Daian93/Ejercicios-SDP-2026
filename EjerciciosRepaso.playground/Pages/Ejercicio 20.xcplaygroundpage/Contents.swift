//: [Previous](@previous)

import Foundation

/*: Crea una clase Usuario que tenga, al menos, las propiedades: nombre, edad, generos y directores. Añade el genero a la clase Pelicula. Crea una función recomendarPelicula que reciba dos parámetros: un objeto de tipo Pelicula y uno de tipo Usuario. Cargando datos de prueba crea una función recomendarPeliculas que devuelve un array con películas que podrían gustarle al usuario según sus preferencias. Crea varias instancias de Usuario y Pelicula con distintas combinaciones de géneros y directores para comprobar que la función recomendarPelicula retorna el mensaje esperado en cada caso. */

class Usuario {
    var nombre: String
    var edad: Int
    var generos: [String]
    var directores: [String]

    init(nombre: String, edad: Int, generos: [String], directores: [String]) {
        self.nombre = nombre
        self.edad = edad
        self.generos = generos
        self.directores = directores
    }
}

class Pelicula {
    var titulo: String
    var director: String
    var estreno: Int
    let genero: String

    init(titulo: String, director: String, estreno: Int, genero: String) {
        self.titulo = titulo
        self.director = director
        self.estreno = estreno
        self.genero = genero
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
        print(
            "La película \(titulo) se está reproduciendo para \(usuario.nombre)"
        )
    }
}

func recomendarPelicula(pelicula: Pelicula, usuario: Usuario) -> String {
    let leGustaGenero = usuario.generos.contains(pelicula.genero)
    let leGustaDirector = usuario.directores.contains(pelicula.director)

    if leGustaGenero && leGustaDirector {
        return
            "A \(usuario.nombre) le encantará '\(pelicula.titulo)' (género y director coinciden)."
    } else if leGustaGenero {
        return
            "A \(usuario.nombre) probablemente le guste '\(pelicula.titulo)' por su género."
    } else if leGustaDirector {
        return
            "A \(usuario.nombre) probablemente le guste '\(pelicula.titulo)' por su director."
    } else {
        return
            "'\(pelicula.titulo)' no coincide con los gustos de \(usuario.nombre)."
    }
}

func recomendarPeliculas(para usuario: Usuario, peliculas: [Pelicula]) -> [Pelicula] {
    return peliculas.filter {
        usuario.generos.contains($0.genero) || usuario.directores.contains($0.director)
    }
}

let peliculas = [
    Pelicula(
        titulo: "Inception",
        director: "Christopher Nolan",
        estreno: 2010,
        genero: "Ciencia ficción"
    ),
    Pelicula(
        titulo: "Pulp Fiction",
        director: "Quentin Tarantino",
        estreno: 1994,
        genero: "Crimen"
    ),
    Pelicula(
        titulo: "Interstellar",
        director: "Christopher Nolan",
        estreno: 2014,
        genero: "Ciencia ficción"
    ),
    Pelicula(
        titulo: "Titanic",
        director: "James Cameron",
        estreno: 1997,
        genero: "Romance"
    ),
]

let usuario1 = Usuario(
    nombre: "Ana",
    edad: 25,
    generos: ["Ciencia ficción"],
    directores: ["Christopher Nolan"]
)

let usuario2 = Usuario(
    nombre: "Luis",
    edad: 30,
    generos: ["Crimen"],
    directores: ["Martin Scorsese"]
)

print(recomendarPelicula(pelicula: peliculas[0], usuario: usuario1))
print(recomendarPelicula(pelicula: peliculas[1], usuario: usuario1))
print(recomendarPelicula(pelicula: peliculas[1], usuario: usuario2))

let recomendacionesAna = recomendarPeliculas(para: usuario1, peliculas: peliculas)

print("Películas recomendadas para \(usuario1.nombre):")
for pelicula in recomendacionesAna {
    print("- \(pelicula.titulo)")
}


//: [Next](@next)
