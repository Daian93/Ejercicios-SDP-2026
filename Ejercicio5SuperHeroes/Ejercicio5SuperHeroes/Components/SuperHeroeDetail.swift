//
//  SuperHeroeDetail.swift
//  Ejercicio5SuperHeroes
//
//  Created by Diana Rammal Sansón on 3/11/25.
//

import SwiftUI

struct SuperHeroeDetail: View {
    let superheroe: SuperHero

    var body: some View {
        ZStack {
            HeroGradientBackground()

            ScrollView {
                VStack(spacing: 20) {
                    HeroHeaderView(superheroe: superheroe)

                    Divider().background(Color.white.opacity(0.5))

                    HStack {
                        Text("Edad:")
                            .font(.headline)
                            .foregroundStyle(.white)
                        Text("\(superheroe.edad) años")
                            .font(.body)
                            .foregroundStyle(.white.opacity(0.9))
                    }

                    HeroPoderesView(poderes: superheroe.poderes)

                    HeroDescripcionView(descripcion: superheroe.descripcion)
                }
                .padding(.horizontal, 30)
            }
        }
        .navigationTitle(superheroe.apodo)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Sub-vistas privadas

private struct HeroHeaderView: View {
    let superheroe: SuperHero

    var body: some View {
        VStack(spacing: 16) {
            Image(superheroe.imagen)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .clipShape(Circle())
                .overlay(Circle().stroke(.white, lineWidth: 4))
                .shadow(radius: 10)
                .padding(.top, 30)

            VStack(spacing: 4) {
                Text(superheroe.apodo)
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
                    .shadow(radius: 3)

                Text(superheroe.nombreReal)
                    .font(.title3)
                    .foregroundStyle(.white.opacity(0.9))
            }
        }
    }
}

private struct HeroPoderesView: View {
    let poderes: [PoderesSuperheroes]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Poderes:")
                .font(.headline)
                .foregroundStyle(.white)
            ForEach(poderes, id: \.self) { poder in
                Text("• \(poder.rawValue)")
                    .foregroundStyle(.white.opacity(0.9))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

private struct HeroDescripcionView: View {
    let descripcion: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Descripción:")
                .font(.headline)
                .foregroundStyle(.white)
            Text(descripcion)
                .foregroundStyle(.white.opacity(0.9))
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
        }
        .padding(.bottom, 40)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    SuperHeroeDetail(superheroe: heroTest)
}

