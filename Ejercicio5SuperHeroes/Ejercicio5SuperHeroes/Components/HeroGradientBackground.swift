//
//  HeroGradientBackground.swift
//  Ejercicio5SuperHeroes
//
//  Created by Diana Rammal Sansón on 3/11/25.
//

import SwiftUI

// Vista reutilizable que aplica el gradiente de fondo de la app.
struct HeroGradientBackground: View {
    var body: some View {
        LinearGradient(
            colors: [.blue.opacity(0.8), .black.opacity(0.8)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

#Preview {
    HeroGradientBackground()
}
