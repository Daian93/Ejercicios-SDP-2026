//
//  TaskDetailView.swift
//  Ejercicio3ListaTareas
//
//  Created by Diana Rammal Sansón
//

import SwiftUI

struct TaskDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let viewModel: TaskListViewModel
    let task: Task
    
    @State private var showEditSheet = false
    @State private var showDeleteAlert = false
    
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 0.2, green: 0.3, blue: 0.5),
                    Color(red: 0.1, green: 0.15, blue: 0.3)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Status Badge
                    HStack {
                        Spacer()
                        
                        HStack(spacing: 6) {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                            Text(task.isCompleted ? "Completada" : "Pendiente")
                                .font(.subheadline)
                                .fontWeight(.medium)
                        }
                        .foregroundStyle(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(task.isCompleted ? .green.opacity(0.3) : .orange.opacity(0.3))
                        )
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    // Task Name
                    VStack(alignment: .leading, spacing: 8) {
                        Text("TAREA")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white.opacity(0.6))
                        
                        Text(task.name)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white.opacity(0.15))
                    )
                    
                    // Description
                    VStack(alignment: .leading, spacing: 8) {
                        Text("DESCRIPCIÓN")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white.opacity(0.6))
                        
                        Text(task.description.isEmpty ? "Sin descripción" : task.description)
                            .font(.body)
                            .foregroundStyle(.white.opacity(task.description.isEmpty ? 0.5 : 1))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white.opacity(0.15))
                    )
                    
                    // Date
                    VStack(alignment: .leading, spacing: 8) {
                        Text("FECHA")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white.opacity(0.6))
                        
                        HStack {
                            Image(systemName: "calendar")
                                .foregroundStyle(.blue)
                            Text(task.date, style: .date)
                                .font(.body)
                                .foregroundStyle(.white)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .fill(.white.opacity(0.15))
                    )
                    
                    Spacer()
                    
                    // Action Buttons
                    VStack(spacing: 12) {
                        // Toggle Completion
                        Button {
                            viewModel.toggleTaskCompletion(task)
                        } label: {
                            HStack {
                                Image(systemName: task.isCompleted ? "arrow.uturn.backward.circle.fill" : "checkmark.circle.fill")
                                Text(task.isCompleted ? "Marcar como pendiente" : "Marcar como completada")
                                    .fontWeight(.semibold)
                            }
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(.blue)
                            )
                        }
                        
                        // Edit Button
                        Button {
                            showEditSheet = true
                        } label: {
                            HStack {
                                Image(systemName: "pencil")
                                Text("Editar Tarea")
                                    .fontWeight(.semibold)
                            }
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(.white.opacity(0.2))
                            )
                        }
                        
                        // Delete Button
                        Button {
                            showDeleteAlert = true
                        } label: {
                            HStack {
                                Image(systemName: "trash")
                                Text("Eliminar Tarea")
                                    .fontWeight(.semibold)
                            }
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 14)
                                    .fill(.red.opacity(0.6))
                            )
                        }
                    }
                    .padding(.bottom)
                }
                .padding()
            }
        }
        .navigationTitle("Detalles")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $showEditSheet) {
            EditTaskView(viewModel: viewModel, task: task)
        }
        .alert("Eliminar Tarea", isPresented: $showDeleteAlert) {
            Button("Cancelar", role: .cancel) { }
            Button("Eliminar", role: .destructive) {
                viewModel.deleteTask(task)
                dismiss()
            }
        } message: {
            Text("¿Estás seguro de que quieres eliminar esta tarea? Esta acción no se puede deshacer.")
        }
    }
}
