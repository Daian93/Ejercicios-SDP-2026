//
//  SuperHeroeCard.swift
//  Ejercicio5SuperHeroes
//
//  Created by Diana Rammal Sansón on 3/11/25.
//

import SwiftUI

struct SuperHeroeCard: View {
    let superheroe: SuperHero

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(superheroe.imagen)
                .resizable()
                .scaledToFill()
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(10)
                .shadow(radius: 2)

            VStack {
                Text(superheroe.apodo)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white.opacity(0.8))
                    )
                    .padding(.bottom, 8)
            }
        }
        .frame(width: 150, height: 180)
        .contentShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    SuperHeroeCard(superheroe: heroTest)
}

