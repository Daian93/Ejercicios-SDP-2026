//
//  Background.swift
//  Ejercicio1Music
//
//  Created by Diana Rammal Sansón on 31/10/25.
//

import SwiftUI

struct Background: View {
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                Image("sunset")
                    .resizable()
                    .scaledToFill()
                    .frame(maxHeight: geo.size.height)
                    .clipped()
                Color(red: 0.031, green: 0.062, blue: 0.156)
            }
            .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Background()
}
