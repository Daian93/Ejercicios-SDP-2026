//
//  DynamicBackground.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 2/11/25.
//

import SwiftUI

struct DynamicBackground: View {
    @Environment(\.colorScheme) var colorScheme
        
        var body: some View {
            LinearGradient(
                gradient: Gradient(colors: backgroundColors),
                startPoint: .topTrailing,
                endPoint: .bottomLeading
            )
            .ignoresSafeArea()
        }
        
        private var backgroundColors: [Color] {
            if colorScheme == .dark {
                return [.blue.opacity(0.3), .black.opacity(0.4)]
            } else {
                return [.blue.opacity(0.9), .gray.opacity(0.3)]
            }
        }
}

#Preview {
    DynamicBackground()
}
