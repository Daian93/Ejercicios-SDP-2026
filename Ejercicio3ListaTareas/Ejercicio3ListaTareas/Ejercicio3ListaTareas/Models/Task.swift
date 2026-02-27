//
//  Task.swift
//  Ejercicio3ListaTareas
//
//  Created by Diana Rammal Sansón
//

import Foundation

@Observable
class Task: Identifiable, Hashable {
    let id: UUID
    var name: String
    var description: String
    var date: Date
    var isCompleted: Bool
    
    init(id: UUID = UUID(), name: String, description: String, date: Date, isCompleted: Bool = false) {
        self.id = id
        self.name = name
        self.description = description
        self.date = date
        self.isCompleted = isCompleted
    }
    
    // Hashable conformance
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    // Equatable conformance (required by Hashable)
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.id == rhs.id
    }
}
