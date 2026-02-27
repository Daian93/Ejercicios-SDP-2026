//
//  AddTaskView.swift
//  Ejercicio3ListaTareas
//
//  Created by Diana Rammal Sansón
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) private var dismiss
    let viewModel: TaskListViewModel

    @State private var taskName: String = ""
    @State private var taskDescription: String = ""
    @State private var taskDate: Date = Date()

    var body: some View {
        NavigationStack {
            ZStack {
                // Background gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 0.2, green: 0.3, blue: 0.5),
                        Color(red: 0.1, green: 0.15, blue: 0.3),
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 24) {
                        // Task Name
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nombre de la tarea")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)

                            TextField("Ej: Comprar leche", text: $taskName)
                                .textFieldStyle(.plain)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.white.opacity(0.25))
                                )
                                .foregroundStyle(.white)
                                .tint(.blue)
                        }

                        // Task Description
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Descripción")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)

                            TextField(
                                "Ej: En el supermercado de la esquina",
                                text: $taskDescription,
                                axis: .vertical
                            )
                            .textFieldStyle(.plain)
                            .lineLimit(3...5)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.white.opacity(0.25))
                            )
                            .foregroundStyle(.white)
                            .tint(.blue)
                        }

                        // Date Picker
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Fecha")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)

                            DatePicker(
                                "",
                                selection: $taskDate,
                                displayedComponents: [.date]
                            )
                            .datePickerStyle(.graphical)
                            .tint(.blue)
                            .colorScheme(.dark)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.white.opacity(0.25))
                            )
                        }

                        // Add Button
                        Button {
                            if !taskName.isEmpty {
                                viewModel.addTask(
                                    name: taskName,
                                    description: taskDescription,
                                    date: taskDate
                                )
                                dismiss()
                            }
                        } label: {
                            Text("Añadir Tarea")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(
                                            taskName.isEmpty
                                                ? .gray.opacity(0.5) : .blue
                                        )
                                )
                        }
                        .disabled(taskName.isEmpty)
                        .padding(.top, 8)
                    }
                    .padding()
                    .padding(.top, 8)
                }
            }
            .navigationTitle("Nueva Tarea")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarBackground(
                Color(red: 0.15, green: 0.25, blue: 0.45).opacity(0.95),
                for: .navigationBar
            )
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                    .foregroundStyle(.white)
                }
            }
        }
    }
}
