//
//  TaskListSelector.swift
//  Ejercicio3ListaTareas
//
//  Created by Diana Rammal Sansón
//

import SwiftUI

struct TaskListSelector: View {
    let lists: [TaskList]
    let selectedIndex: Int
    let onSelect: (Int) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(Array(lists.enumerated()), id: \.element.id) { index, list in
                    Button {
                        onSelect(index)
                    } label: {
                        HStack(spacing: 8) {
                            Circle()
                                .fill(colorForList(list.color))
                                .frame(width: 10, height: 10)
                            
                            Text(list.name)
                                .font(.subheadline)
                                .fontWeight(selectedIndex == index ? .semibold : .regular)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(selectedIndex == index ? .white.opacity(0.25) : .white.opacity(0.1))
                        )
                    }
                    .foregroundStyle(.white)
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func colorForList(_ colorName: String) -> Color {
        switch colorName {
        case "blue": return .blue
        case "green": return .green
        case "orange": return .orange
        case "purple": return .purple
        case "pink": return .pink
        case "red": return .red
        case "yellow": return .yellow
        default: return .blue
        }
    }
}
