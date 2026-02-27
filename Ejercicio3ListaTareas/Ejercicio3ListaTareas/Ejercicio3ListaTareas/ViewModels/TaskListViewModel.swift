//
//  TaskListViewModel.swift
//  Ejercicio3ListaTareas
//
//  Created by Diana Rammal Sansón
//

import Foundation

enum DateFilter {
    case today
    case tomorrow
    case month
    case all
}

@MainActor
@Observable
class TaskListViewModel {
    var taskLists: [TaskList] = []
    var selectedListIndex: Int = 0
    var selectedDateFilter: DateFilter = .all
    
    var selectedList: TaskList? {
        guard !taskLists.isEmpty && selectedListIndex < taskLists.count else { return nil }
        return taskLists[selectedListIndex]
    }
    
    var filteredTasks: [Task] {
        guard let list = selectedList else { return [] }
        
        switch selectedDateFilter {
        case .today:
            return list.tasks.filter { Calendar.current.isDateInToday($0.date) }
        case .tomorrow:
            return list.tasks.filter { Calendar.current.isDateInTomorrow($0.date) }
        case .month:
            return list.tasks.filter { 
                Calendar.current.isDate($0.date, equalTo: Date(), toGranularity: .month)
            }
        case .all:
            return list.tasks
        }
    }
    
    init() {
        // Create a default list with sample tasks
        let sampleTasks = [
            Task(name: "Comprar comida", description: "Ir al supermercado", date: Date()),
            Task(name: "Hacer ejercicio", description: "Gimnasio 1 hora", date: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()),
            Task(name: "Leer libro", description: "30 minutos de lectura", date: Date())
        ]
        
        let defaultList = TaskList(name: "Personal", color: "blue", tasks: sampleTasks)
        taskLists.append(defaultList)
    }
    
    // MARK: - Task Management
    
    func addTask(name: String, description: String, date: Date) {
        guard let list = selectedList else { return }
        let newTask = Task(name: name, description: description, date: date)
        list.tasks.append(newTask)
    }
    
    func updateTask(_ task: Task, name: String, description: String, date: Date) {
        task.name = name
        task.description = description
        task.date = date
    }
    
    func toggleTaskCompletion(_ task: Task) {
        task.isCompleted.toggle()
    }
    
    func deleteTask(_ task: Task) {
        guard let list = selectedList else { return }
        list.tasks.removeAll { $0.id == task.id }
    }
    
    // MARK: - List Management
    
    func addList(name: String, color: String) {
        let newList = TaskList(name: name, color: color)
        taskLists.append(newList)
        selectedListIndex = taskLists.count - 1
    }
    
    func deleteList(at index: Int) {
        guard taskLists.count > 1, index < taskLists.count else { return }
        taskLists.remove(at: index)
        if selectedListIndex >= taskLists.count {
            selectedListIndex = taskLists.count - 1
        }
    }
    
    func selectList(at index: Int) {
        guard index < taskLists.count else { return }
        selectedListIndex = index
    }
    
    // MARK: - Filter Management
    
    func setDateFilter(_ filter: DateFilter) {
        selectedDateFilter = filter
    }
}
