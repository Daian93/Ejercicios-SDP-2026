//
//  ContentView.swift
//  Ejercicio3ListaTareas
//
//  Created by Diana Rammal Sansón on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    @Bindable var viewModel: TaskListViewModel
    
    @State private var showAddTask = false
    @State private var showAddList = false
    @State private var selectedTask: Task?
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Gradient background
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.15, green: 0.25, blue: 0.45),
                        Color(red: 0.08, green: 0.12, blue: 0.25),
                        Color(red: 0.05, green: 0.08, blue: 0.15)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    // MARK: - Header
                    VStack(spacing: 8) {
                        Text("Mis Tareas")
                            .font(.system(size: 34, weight: .bold))
                            .foregroundStyle(.white)
                        
                        if let listName = viewModel.selectedList?.name {
                            Text(listName)
                                .font(.subheadline)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                    }
                    .padding(.top, 10)
                    
                    // MARK: - List Selector
                    if viewModel.taskLists.count > 1 {
                        TaskListSelector(
                            lists: viewModel.taskLists,
                            selectedIndex: viewModel.selectedListIndex,
                            onSelect: { index in
                                viewModel.selectList(at: index)
                            }
                        )
                    }
                    
                    // MARK: - Filter Buttons
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            FilterButton(
                                title: "Todas",
                                icon: "square.stack.3d.up",
                                isSelected: viewModel.selectedDateFilter == .all,
                                action: { viewModel.setDateFilter(.all) }
                            )
                            
                            FilterButton(
                                title: "Hoy",
                                icon: "sun.max.fill",
                                isSelected: viewModel.selectedDateFilter == .today,
                                action: { viewModel.setDateFilter(.today) }
                            )
                            
                            FilterButton(
                                title: "Mañana",
                                icon: "sunrise.fill",
                                isSelected: viewModel.selectedDateFilter == .tomorrow,
                                action: { viewModel.setDateFilter(.tomorrow) }
                            )
                            
                            FilterButton(
                                title: "Este Mes",
                                icon: "calendar",
                                isSelected: viewModel.selectedDateFilter == .month,
                                action: { viewModel.setDateFilter(.month) }
                            )
                        }
                        .padding(.horizontal)
                    }
                    
                    // MARK: - Task List
                    ScrollView {
                        if viewModel.filteredTasks.isEmpty {
                            VStack(spacing: 16) {
                                Image(systemName: "checkmark.circle")
                                    .font(.system(size: 60))
                                    .foregroundStyle(.white.opacity(0.3))
                                
                                Text("No hay tareas")
                                    .font(.title3)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.white.opacity(0.6))
                                
                                Text("Toca el botón + para añadir una tarea")
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .frame(maxWidth: .infinity)
                            .padding(.top, 60)
                        } else {
                            LazyVStack(spacing: 12) {
                                ForEach(viewModel.filteredTasks) { task in
                                    TaskCard(
                                        task: task,
                                        onToggle: {
                                            viewModel.toggleTaskCompletion(task)
                                        },
                                        onTap: {
                                            selectedTask = task
                                        }
                                    )
                                }
                            }
                            .padding(.horizontal)
                            .padding(.top, 8)
                        }
                    }
                    
                    // MARK: - Bottom Actions
                    HStack(spacing: 16) {
                        Button {
                            showAddTask = true
                        } label: {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title3)
                                Text("Nueva Tarea")
                                    .fontWeight(.semibold)
                            }
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.blue)
                                    .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 4)
                            )
                        }
                        
                        Button {
                            showAddList = true
                        } label: {
                            HStack {
                                Image(systemName: "list.bullet.rectangle.portrait.fill")
                                    .font(.title3)
                            }
                            .foregroundStyle(.white)
                            .frame(width: 60, height: 60)
                            .background(
                                RoundedRectangle(cornerRadius: 16)
                                    .fill(.white.opacity(0.2))
                            )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                }
            }
            .sheet(isPresented: $showAddTask) {
                AddTaskView(viewModel: viewModel)
            }
            .sheet(isPresented: $showAddList) {
                AddListView(viewModel: viewModel)
            }
            .navigationDestination(item: $selectedTask) { task in
                TaskDetailView(viewModel: viewModel, task: task)
            }
        }
    }
}

#Preview {
    ContentView(viewModel: TaskListViewModel())
}
