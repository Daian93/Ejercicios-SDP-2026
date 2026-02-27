//
//  CardModifier.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 27/2/26.
//

import SwiftUI

struct CardModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.white.opacity(0.25))
            )
            .padding(.horizontal)
    }
}

extension View {
    func cardStyle() -> some View {
        modifier(CardModifier())
    }
}

#Preview {
    Text("Card Style Example")
        .padding()
        .cardStyle()
}
