//
//  Ejercicio3ListaTareasApp.swift
//  Ejercicio3ListaTareas
//
//  Created by Diana Rammal Sansón on 3/11/25.
//

import SwiftUI

@main
struct Ejercicio3ListaTareasApp: App {
    @State private var viewModel = TaskListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
        }
    }
}
