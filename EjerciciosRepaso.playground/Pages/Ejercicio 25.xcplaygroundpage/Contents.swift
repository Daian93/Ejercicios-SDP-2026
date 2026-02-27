//: [Previous](@previous)

import Foundation

/*: Crea la estructura de un hospital usando structs en lugar de clases. Define structs para Doctor (con nombre y especialidad), Enfermero (nombre y turno), Paciente (nombre, edad y diagnóstico) y Sala (número y lista de pacientes). Luego, en un struct Hospital, almacena varias salas y desarrolla funciones para obtener listados por especialidad o contar pacientes críticos. */

struct Doctor {
    let nombre: String
    let especialidad: String
}

struct Enfermero {
    let nombre: String
    let turno: String
}

struct Paciente {
    let nombre: String
    let edad: Int
    let diagnostico: String
}

struct Sala {
    let numero: Int
    var pacientes: [Paciente]
    var doctores: [Doctor] // Para poder obtener los listados por especialidad he añadido los doctores
}

struct Hospital {
    var salas: [Sala]

    func doctoresPorEspecialidad(_ especialidad: String) -> [Doctor] {
        salas.flatMap { $0.doctores }.filter {
            $0.especialidad.lowercased() == especialidad.lowercased()
        }
    }

    func contarPacientesCriticos() -> Int {
        salas.flatMap { $0.pacientes }.filter {
            $0.diagnostico.lowercased().contains("crítico")
        }.count
    }

    func listarTodosPacientes() -> [Paciente] {
        salas.flatMap { $0.pacientes }
    }
}

// Creamos las diferentes instancias de doctores, pacientes, salas y hospital
let doctor1 = Doctor(nombre: "Dr. Pérez", especialidad: "Cardiología")
let doctor2 = Doctor(nombre: "Dra. Gómez", especialidad: "Neurología")

let paciente1 = Paciente(nombre: "Juan", edad: 45, diagnostico: "Crítico")
let paciente2 = Paciente(nombre: "Ana", edad: 30, diagnostico: "Leve")
let paciente3 = Paciente(nombre: "Luis", edad: 70, diagnostico: "Crítico")
let paciente4 = Paciente(nombre: "Marta", edad: 25, diagnostico: "Moderado")

let sala1 = Sala(
    numero: 101,
    pacientes: [paciente1, paciente2],
    doctores: [doctor1]
)
let sala2 = Sala(
    numero: 102,
    pacientes: [paciente3, paciente4],
    doctores: [doctor2]
)

let hospital = Hospital(salas: [sala1, sala2])

let pacientesCardiologia = hospital.doctoresPorEspecialidad("Cardiología")
print("Doctores que tienen en su especialidad Cardiología:")
pacientesCardiologia.forEach { print($0.nombre) }

let pacientesCriticos = hospital.contarPacientesCriticos()
print("\nNúmero de pacientes críticos: \(pacientesCriticos)")

let todosPacientes = hospital.listarTodosPacientes()
print("\nTodos los pacientes:")
todosPacientes.forEach { print($0.nombre) }

//: [Next](@next)
