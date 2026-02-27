//
//  AddListView.swift
//  Ejercicio3ListaTareas
//
//  Created by Diana Rammal Sansón
//

import SwiftUI

struct AddListView: View {
    @Environment(\.dismiss) private var dismiss
    let viewModel: TaskListViewModel

    @State private var listName: String = ""
    @State private var selectedColor: String = "blue"

    let availableColors: [(name: String, color: Color)] = [
        ("blue", .blue),
        ("green", .green),
        ("orange", .orange),
        ("purple", .purple),
        ("pink", .pink),
        ("red", .red),
        ("yellow", .yellow),
    ]

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
                        // List Name
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Nombre de la lista")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)

                            TextField(
                                "Ej: Trabajo, Personal...",
                                text: $listName
                            )
                            .textFieldStyle(.plain)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.white.opacity(0.25))
                            )
                            .foregroundStyle(.white)
                            .tint(.blue)
                        }

                        // Color Selection
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Color")
                                .font(.subheadline)
                                .fontWeight(.medium)
                                .foregroundStyle(.white)

                            LazyVGrid(
                                columns: [GridItem(.adaptive(minimum: 60))],
                                spacing: 16
                            ) {
                                ForEach(availableColors, id: \.name) {
                                    colorItem in
                                    Button {
                                        selectedColor = colorItem.name
                                    } label: {
                                        Circle()
                                            .fill(colorItem.color)
                                            .frame(width: 50, height: 50)
                                            .overlay(
                                                Circle()
                                                    .stroke(
                                                        .white,
                                                        lineWidth: selectedColor
                                                            == colorItem.name
                                                            ? 3 : 0
                                                    )
                                            )
                                            .shadow(
                                                color: colorItem.color.opacity(
                                                    0.4
                                                ),
                                                radius: selectedColor
                                                    == colorItem.name ? 8 : 0
                                            )
                                    }
                                }
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.white.opacity(0.2))
                            )
                        }

                        // Create Button
                        Button {
                            if !listName.isEmpty {
                                viewModel.addList(
                                    name: listName,
                                    color: selectedColor
                                )
                                dismiss()
                            }
                        } label: {
                            Text("Crear Lista")
                                .font(.headline)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 14)
                                        .fill(
                                            listName.isEmpty
                                                ? .gray.opacity(0.5) : .blue
                                        )
                                )
                        }
                        .disabled(listName.isEmpty)
                        .padding(.top, 8)
                    }
                    .padding()
                    .padding(.top, 8)
                }
            }
            .navigationTitle("Nueva Lista")
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
