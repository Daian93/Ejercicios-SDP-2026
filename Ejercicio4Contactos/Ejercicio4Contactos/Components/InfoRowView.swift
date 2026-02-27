//
//  InfoRowView.swift
//  Ejercicio4Contactos
//
//  Created by Diana Rammal Sansón on 2/2/26.
//

import SwiftUI

// MARK: - InfoRowView
struct InfoRowView: View {
    let icon: String
    let iconColor: Color
    let label: String
    let value: String
    var action: (() -> Void)? = nil

    var body: some View {
        Button {
            action?()
        } label: {
            HStack(spacing: 14) {
                // Icon
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(iconColor.opacity(0.14))
                        .frame(width: 38, height: 38)
                    Image(systemName: icon)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundStyle(iconColor)
                }

                VStack(alignment: .leading, spacing: 2) {
                    Text(label)
                        .font(
                            .system(size: 11, weight: .medium, design: .rounded)
                        )
                        .foregroundStyle(.textTertiary)
                    Text(value)
                        .font(.system(size: 15, weight: .regular))
                        .foregroundStyle(.textPrimary)
                }

                Spacer()

                if action != nil {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundStyle(.textTertiary)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                .cardBackground,
                in: RoundedRectangle(cornerRadius: 14, style: .continuous)
            )
        }
        .buttonStyle(.plain)
        .disabled(action == nil)
    }
}

// MARK: - SectionHeaderView
struct SectionHeaderView: View {
    let title: String
    var icon: String? = nil
    var actionTitle: String? = nil
    var action: (() -> Void)? = nil

    var body: some View {
        HStack(alignment: .center) {
            if let icon {
                Image(systemName: icon)
                    .font(.system(size: 13, weight: .semibold))
                    .foregroundStyle(.brandPrimary)
            }
            Text(title.uppercased())
                .font(.system(size: 12, weight: .bold, design: .rounded))
                .foregroundStyle(.textSecondary)
                .kerning(0.8)

            Spacer()

            if let actionTitle, let action {
                Button(actionTitle, action: action)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundStyle(.brandPrimary)
            }
        }
        .padding(.horizontal, 4)
        .padding(.top, 8)
        .padding(.bottom, 4)
    }
}

// MARK: - CardContainer
struct CardContainer<Content: View>: View {
    var padding: CGFloat = 0
    @ViewBuilder var content: Content

    var body: some View {
        content
            .padding(padding)
            .background(
                .cardBackground,
                in: RoundedRectangle(cornerRadius: 18, style: .continuous)
            )
            .shadow(color: .black.opacity(0.05), radius: 8, x: 0, y: 2)
    }
}

// MARK: - StatBadge
struct StatBadge: View {
    let icon: String
    let value: String
    let label: String
    let color: Color

    var body: some View {
        VStack(spacing: 4) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.12))
                    .frame(width: 44, height: 44)
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(color)
            }
            Text(value)
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .foregroundStyle(.textPrimary)
            Text(label)
                .font(.system(size: 11, weight: .medium, design: .rounded))
                .foregroundStyle(.textSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 14)
        .background(
            .cardBackground,
            in: RoundedRectangle(cornerRadius: 16, style: .continuous)
        )
        .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
    }
}

#Preview {
    VStack(spacing: 12) {
        SectionHeaderView(
            title: "Teléfonos",
            icon: "phone.fill",
            actionTitle: "Ver todo"
        ) {}
        InfoRowView(
            icon: "phone.fill",
            iconColor: .tagWork,
            label: "Móvil",
            value: "+34 612 345 678"
        ) {}
        InfoRowView(
            icon: "envelope.fill",
            iconColor: .brandPrimary,
            label: "Personal",
            value: "ana@mail.com"
        )
        HStack {
            StatBadge(
                icon: "person.2.fill",
                value: "8",
                label: "Contactos",
                color: .brandPrimary
            )
            StatBadge(
                icon: "star.fill",
                value: "2",
                label: "Favoritos",
                color: .tagFriend
            )
        }
    }
    .padding()
    .background(.appBackground)
}
