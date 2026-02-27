//
//  TaskList.swift
//  Ejercicio3ListaTareas
//
//  Created by Diana Rammal Sansón
//

import Foundation

@Observable
class TaskList: Identifiable {
    let id: UUID
    var name: String
    var color: String
    var tasks: [Task]
    
    init(id: UUID = UUID(), name: String, color: String = "blue", tasks: [Task] = []) {
        self.id = id
        self.name = name
        self.color = color
        self.tasks = tasks
    }
}
