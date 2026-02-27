//
//  AvatarView.swift
//  Ejercicio4Contactos
//
//  Created by Diana Rammal Sansón on 2/2/26.
//

import SwiftUI

// MARK: - AvatarView
struct AvatarView: View {
    let contact: Contact
    let size: CGFloat

    private var gradient: LinearGradient {
        let index = contact.avatarGradientIndex % AvatarGradient.allCases.count
        return AvatarGradient.allCases[index].gradient
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(gradient)
                .frame(width: size, height: size)
                .shadow(
                    color: .black.opacity(0.18),
                    radius: size * 0.1,
                    x: 0,
                    y: size * 0.05
                )

            Text(contact.initials)
                .font(
                    .system(
                        size: size * 0.38,
                        weight: .semibold,
                        design: .rounded
                    )
                )
                .foregroundStyle(.white)
        }
    }
}

// MARK: - AvatarView Large (with ring)
struct AvatarViewLarge: View {
    let contact: Contact
    let size: CGFloat

    private var gradient: LinearGradient {
        let index = contact.avatarGradientIndex % AvatarGradient.allCases.count
        return AvatarGradient.allCases[index].gradient
    }

    var body: some View {
        ZStack {
            Circle()
                .fill(gradient)
                .frame(width: size, height: size)
                .overlay {
                    Circle()
                        .strokeBorder(
                            .white.opacity(0.6),
                            lineWidth: size * 0.04
                        )
                }
                .shadow(color: .black.opacity(0.15), radius: 12, x: 0, y: 6)

            // Initials
            Text(contact.initials)
                .font(
                    .system(size: size * 0.36, weight: .bold, design: .rounded)
                )
                .foregroundStyle(.white)

            // Favorite badge
            if contact.isFavorite {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(.white)
                                .frame(width: size * 0.28, height: size * 0.28)
                                .shadow(
                                    color: .black.opacity(0.1),
                                    radius: 4,
                                    x: 0,
                                    y: 2
                                )
                            Image(systemName: "star.fill")
                                .font(.system(size: size * 0.14))
                                .foregroundStyle(.brandAccent)
                        }
                    }
                }
                .frame(width: size, height: size)
            }
        }
    }
}

#Preview {
    HStack(spacing: 16) {
        AvatarView(contact: Contact.samples[0], size: 52)
        AvatarView(contact: Contact.samples[1], size: 52)
        AvatarViewLarge(contact: Contact.samples[0], size: 96)
    }
    .padding()
}
