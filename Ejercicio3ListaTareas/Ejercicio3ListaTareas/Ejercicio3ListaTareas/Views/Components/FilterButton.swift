//
//  FilterButton.swift
//  Ejercicio3ListaTareas
//
//  Created by Diana Rammal Sansón
//

import SwiftUI

struct FilterButton: View {
    let title: String
    let icon: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Label(title, systemImage: icon)
                .font(.subheadline)
                .fontWeight(isSelected ? .semibold : .regular)
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .fill(isSelected ? .white.opacity(0.3) : .white.opacity(0.1))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.white.opacity(isSelected ? 0.5 : 0.2), lineWidth: 1)
                )
        }
        .foregroundStyle(.white)
    }
}
