//
//  ContactRowView.swift
//  Ejercicio4Contactos
//
//  Created by Diana Rammal Sansón on 2/2/26.
//

import SwiftUI

// MARK: - ContactRowView
struct ContactRowView: View {
    let contact: Contact

    var body: some View {
        HStack(spacing: 14) {
            AvatarView(contact: contact, size: 62)

            VStack(alignment: .leading, spacing: 3) {
                Text(contact.fullName)
                    .font(
                        .system(size: 16, weight: .semibold, design: .rounded)
                    )
                    .foregroundStyle(.textPrimary)

                if !contact.jobTitle.isEmpty || !contact.company.isEmpty {
                    Text(
                        [contact.jobTitle, contact.company].filter {
                            !$0.isEmpty
                        }.joined(separator: " · ")
                    )
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(.textSecondary)
                    .lineLimit(1)
                }

                if let phone = contact.primaryPhone {
                    Text(phone)
                        .font(
                            .system(
                                size: 12,
                                weight: .regular,
                                design: .monospaced
                            )
                        )
                        .foregroundStyle(.textTertiary)
                }
            }

            Spacer()

            VStack(alignment: .trailing, spacing: 6) {
                TagBadgeView(tag: contact.tag, compact: true)

                if contact.isFavorite {
                    Image(systemName: "star.fill")
                        .font(.system(size: 12))
                        .foregroundStyle(.brandAccent)
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(
            .cardBackground,
            in: RoundedRectangle(cornerRadius: 16, style: .continuous)
        )
        .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
    }
}

// MARK: - BirthdayCardView
struct BirthdayCardView: View {
    let contact: Contact

    private var daysUntil: Int {
        let today = Calendar.current.startOfDay(for: Date())
        guard let bday = contact.birthday else { return 0 }
        var comps = Calendar.current.dateComponents([.month, .day], from: bday)
        comps.year = Calendar.current.component(.year, from: today)
        let thisYear = Calendar.current.date(from: comps)!
        let target =
            thisYear >= today
            ? thisYear
            : Calendar.current.date(byAdding: .year, value: 1, to: thisYear)!
        return Calendar.current.dateComponents([.day], from: today, to: target)
            .day ?? 0
    }

    private var dayText: String {
        daysUntil == 0
            ? "¡Hoy!" : daysUntil == 1 ? "Mañana" : "En \(daysUntil) días"
    }

    var body: some View {
        HStack(spacing: 12) {
            AvatarView(contact: contact, size: 40)

            VStack(alignment: .leading, spacing: 2) {
                Text(contact.firstName)
                    .font(
                        .system(size: 14, weight: .semibold, design: .rounded)
                    )
                    .foregroundStyle(.textPrimary)
                Text(dayText)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .foregroundStyle(
                        daysUntil == 0 ? .brandAccent : .textSecondary
                    )
            }

            Spacer()

            Image(systemName: "gift.fill")
                .font(.system(size: 16))
                .foregroundStyle(.brandAccent.opacity(0.7))
        }
        .padding(12)
        .frame(width: 190)
        .background(
            RoundedRectangle(cornerRadius: 14, style: .continuous)
                .fill(.cardBackground)
                .shadow(color: .black.opacity(0.06), radius: 6, x: 0, y: 2)
        )
    }
}

// MARK: - EmptyStateView
struct EmptyStateView: View {
    let icon: String
    let title: String
    let subtitle: String
    var actionTitle: String? = nil
    var action: (() -> Void)? = nil

    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(.brandPrimary.opacity(0.08))
                    .frame(width: 90, height: 90)
                Image(systemName: icon)
                    .font(.system(size: 38, weight: .light))
                    .foregroundStyle(.brandPrimary.opacity(0.6))
            }

            VStack(spacing: 6) {
                Text(title)
                    .font(
                        .system(size: 18, weight: .semibold, design: .rounded)
                    )
                    .foregroundStyle(.textPrimary)
                Text(subtitle)
                    .font(.system(size: 14))
                    .foregroundStyle(.textSecondary)
                    .multilineTextAlignment(.center)
            }

            if let actionTitle, let action {
                Button(action: action) {
                    Text(actionTitle)
                        .font(
                            .system(
                                size: 15,
                                weight: .semibold,
                                design: .rounded
                            )
                        )
                        .foregroundStyle(.white)
                        .padding(.horizontal, 28)
                        .padding(.vertical, 12)
                        .background(.brandPrimary, in: Capsule())
                }
            }
        }
        .padding(32)
        .frame(maxWidth: .infinity)
    }
}

// MARK: - FilterChipView
struct FilterChipView: View {
    let filter: ContactFilter
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 5) {
                Image(systemName: filter.icon)
                    .font(.system(size: 11, weight: .semibold))
                Text(filter.rawValue)
                    .font(
                        .system(size: 13, weight: .semibold, design: .rounded)
                    )
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 7)
            .background(
                Capsule()
                    .fill(isSelected ? .brandPrimary : .surfaceLight)
            )
            .foregroundStyle(isSelected ? .white : .textSecondary)
            .animation(.spring(duration: 0.25), value: isSelected)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - AlphabetSectionHeader
struct AlphabetSectionHeader: View {
    let letter: String

    var body: some View {
        HStack {
            Text(letter)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundStyle(.brandPrimary)
                .frame(width: 28, height: 28)
                .background(.brandPrimary.opacity(0.1), in: Circle())
            Rectangle()
                .fill(.separatorLight)
                .frame(height: 1)
        }
        .padding(.horizontal, 4)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 12) {
            ContactRowView(contact: Contact.samples[0])
            BirthdayCardView(contact: Contact.samples[0])
            EmptyStateView(
                icon: "person.2",
                title: "Sin contactos",
                subtitle: "Añade tu primer contacto",
                actionTitle: "Añadir",
                action: {}
            )
            AlphabetSectionHeader(letter: "A")
        }
        .padding()
    }
    .background(.appBackground)
}
