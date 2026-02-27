//
//  ContactDetailView.swift
//  Ejercicio4Contactos
//
//  Created by Diana Rammal Sansón on 2/2/26.
//

import SwiftUI

// MARK: - ContactDetailView
struct ContactDetailView: View {
    let contact: Contact
    @Bindable var viewModel: ContactsViewModel

    @Environment(\.dismiss) private var dismiss
    @State private var showDeleteConfirmation = false

    // Local copy to reflect live updates from viewModel
    private var liveContact: Contact {
        viewModel.contacts.first { $0.id == contact.id } ?? contact
    }

    var body: some View {
        let c = liveContact
        ZStack(alignment: .top) {
            Color.appBackground.ignoresSafeArea()

            ScrollView {
                VStack(spacing: 0) {
                    // Hero header
                    DetailHeroView(contact: c) {
                        viewModel.toggleFavorite(c)
                    }

                    // Content sections
                    VStack(spacing: 20) {
                        // Quick Actions
                        QuickActionsView(contact: c)

                        // Phones
                        if !c.phones.isEmpty {
                            ContactInfoSection(
                                title: "Teléfono",
                                icon: "phone.fill",
                                color: .tagWork
                            ) {
                                ForEach(c.phones) { phone in
                                    InfoRowView(
                                        icon: "phone.fill",
                                        iconColor: .tagWork,
                                        label: phone.label,
                                        value: phone.number
                                    ) {
                                        openURL(
                                            "tel://\(phone.number.replacingOccurrences(of: " ", with: ""))"
                                        )
                                    }
                                }
                            }
                        }

                        // Emails
                        if !c.emails.isEmpty {
                            ContactInfoSection(
                                title: "Correo electrónico",
                                icon: "envelope.fill",
                                color: .brandPrimary
                            ) {
                                ForEach(c.emails) { email in
                                    InfoRowView(
                                        icon: "envelope.fill",
                                        iconColor: .brandPrimary,
                                        label: email.label,
                                        value: email.address
                                    ) {
                                        openURL("mailto:\(email.address)")
                                    }
                                }
                            }
                        }

                        // Addresses
                        if !c.addresses.isEmpty {
                            ContactInfoSection(
                                title: "Dirección",
                                icon: "map.fill",
                                color: .tagFamily
                            ) {
                                ForEach(c.addresses) { address in
                                    InfoRowView(
                                        icon: "mappin.circle.fill",
                                        iconColor: .tagFamily,
                                        label: address.label,
                                        value: address.formatted
                                    ) {
                                        openURL(
                                            "maps://?q=\(address.formatted.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
                                        )
                                    }
                                }
                            }
                        }

                        // Social Networks
                        if !c.socialLinks.isEmpty {
                            ContactInfoSection(
                                title: "Redes sociales",
                                icon: "network",
                                color: .brandSecondary
                            ) {
                                ForEach(c.socialLinks) { link in
                                    InfoRowView(
                                        icon: link.platform.icon,
                                        iconColor: .brandSecondary,
                                        label: link.platform.rawValue,
                                        value: link.handle
                                    )
                                }
                            }
                        }

                        // Birthday
                        if let birthday = c.birthday {
                            ContactInfoSection(
                                title: "Cumpleaños",
                                icon: "gift.fill",
                                color: .brandAccent
                            ) {
                                InfoRowView(
                                    icon: "gift.fill",
                                    iconColor: .brandAccent,
                                    label: "Cumpleaños",
                                    value: birthday.formatted(
                                        date: .long,
                                        time: .omitted
                                    )
                                )
                            }
                        }

                        // Notes
                        if !c.notes.isEmpty {
                            NotesSection(notes: c.notes)
                        }

                        // Danger zone
                        DangerZoneView {
                            showDeleteConfirmation = true
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .padding(.bottom, 40)
                }
            }
        }
        .navigationTitle(c.firstName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.startEditing(c)
                } label: {
                    Text("Editar")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.brandPrimary)
                }
            }
        }
        .sheet(item: $viewModel.contactToEdit) { contact in
            AddEditContactView(viewModel: viewModel, contact: contact)
        }
        .confirmationDialog(
            "¿Eliminar contacto?",
            isPresented: $showDeleteConfirmation,
            titleVisibility: .visible
        ) {
            Button("Eliminar", role: .destructive) {
                viewModel.deleteContact(liveContact)
                dismiss()
            }
            Button("Cancelar", role: .cancel) {}
        } message: {
            Text("Se eliminará \"\(liveContact.fullName)\" permanentemente.")
        }
    }

    private func openURL(_ string: String) {
        guard let url = URL(string: string) else { return }
        #if canImport(UIKit)
            UIApplication.shared.open(url)
        #endif
    }
}

// MARK: - Hero Header
private struct DetailHeroView: View {
    let contact: Contact
    let onToggleFavorite: () -> Void

    private var gradient: LinearGradient {
        let index = contact.avatarGradientIndex % AvatarGradient.allCases.count
        return AvatarGradient.allCases[index].gradient
    }

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                gradient
                    .opacity(0.08)
                    .frame(maxWidth: .infinity)

                VStack(spacing: 14) {
                    AvatarViewLarge(contact: contact, size: 120)
                        .padding(.top, 28)

                    VStack(spacing: 4) {
                        Text(contact.fullName)
                            .font(
                                .system(
                                    size: 26,
                                    weight: .bold,
                                    design: .rounded
                                )
                            )
                            .foregroundStyle(.textPrimary)

                        if !contact.jobTitle.isEmpty || !contact.company.isEmpty
                        {
                            Text(
                                [contact.jobTitle, contact.company]
                                    .filter { !$0.isEmpty }
                                    .joined(separator: " · ")
                            )
                            .font(.system(size: 15, weight: .medium))
                            .foregroundStyle(.textSecondary)
                        }

                        HStack(spacing: 8) {
                            TagBadgeView(tag: contact.tag)

                            Button(action: onToggleFavorite) {
                                HStack(spacing: 4) {
                                    Image(
                                        systemName: contact.isFavorite
                                            ? "star.fill" : "star"
                                    )
                                    .font(.system(size: 11, weight: .semibold))
                                    Text(
                                        contact.isFavorite
                                            ? "Favorito" : "Añadir"
                                    )
                                    .font(
                                        .system(
                                            size: 11,
                                            weight: .semibold,
                                            design: .rounded
                                        )
                                    )
                                }
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(
                                    (contact.isFavorite
                                        ? Color.brandAccent
                                        : Color.surfaceLight),
                                    in: Capsule()
                                )
                                .foregroundStyle(
                                    contact.isFavorite ? .white : .textSecondary
                                )
                            }
                            .buttonStyle(.plain)
                            .animation(
                                .spring(duration: 0.25),
                                value: contact.isFavorite
                            )
                        }
                        .padding(.top, 4)
                    }
                    .padding(.bottom, 24)
                }
                .frame(maxWidth: .infinity)
            }
        }
    }
}

// MARK: - Quick Actions
private struct QuickActionsView: View {
    let contact: Contact

    var body: some View {
        HStack(spacing: 12) {
            if let phone = contact.primaryPhone {
                QuickActionButton(
                    icon: "phone.fill",
                    label: "Llamar",
                    color: .tagWork
                ) {
                    openURL(
                        "tel://\(phone.replacingOccurrences(of: " ", with: ""))"
                    )
                }
            }

            if let email = contact.primaryEmail {
                QuickActionButton(
                    icon: "envelope.fill",
                    label: "Email",
                    color: .brandPrimary
                ) {
                    openURL("mailto:\(email)")
                }
            }

            if let phone = contact.primaryPhone {
                QuickActionButton(
                    icon: "message.fill",
                    label: "Mensaje",
                    color: .tagFamily
                ) {
                    openURL(
                        "sms://\(phone.replacingOccurrences(of: " ", with: ""))"
                    )
                }
            }

            if !contact.addresses.isEmpty, let first = contact.addresses.first {
                QuickActionButton(
                    icon: "map.fill",
                    label: "Mapa",
                    color: .tagFriend
                ) {
                    openURL(
                        "maps://?q=\(first.formatted.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")"
                    )
                }
            }
        }
    }

    private func openURL(_ string: String) {
        guard let url = URL(string: string) else { return }
        #if canImport(UIKit)
            UIApplication.shared.open(url)
        #endif
    }
}

private struct QuickActionButton: View {
    let icon: String
    let label: String
    let color: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(color.opacity(0.12))
                        .frame(width: 52, height: 52)
                    Image(systemName: icon)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(color)
                }
                Text(label)
                    .font(
                        .system(size: 11, weight: .semibold, design: .rounded)
                    )
                    .foregroundStyle(.textSecondary)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Contact Info Section
private struct ContactInfoSection<Content: View>: View {
    let title: String
    let icon: String
    let color: Color
    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeaderView(title: title, icon: icon)
            VStack(spacing: 6) {
                content
            }
        }
    }
}

// MARK: - Notes Section
private struct NotesSection: View {
    let notes: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeaderView(title: "Notas", icon: "note.text")

            HStack(alignment: .top, spacing: 12) {
                Image(systemName: "text.quote")
                    .font(.system(size: 16))
                    .foregroundStyle(.brandPrimary.opacity(0.5))
                    .padding(.top, 2)

                Text(notes)
                    .font(.system(size: 15))
                    .foregroundStyle(.textPrimary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(16)
            .background(
                .cardBackground,
                in: RoundedRectangle(cornerRadius: 14, style: .continuous)
            )
            .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
        }
    }
}

// MARK: - Danger Zone
private struct DangerZoneView: View {
    let onDelete: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeaderView(
                title: "Zona de peligro",
                icon: "exclamationmark.triangle.fill"
            )

            Button(action: onDelete) {
                HStack {
                    Image(systemName: "trash.fill")
                        .font(.system(size: 15, weight: .semibold))
                    Text("Eliminar contacto")
                        .font(
                            .system(
                                size: 15,
                                weight: .semibold,
                                design: .rounded
                            )
                        )
                }
                .foregroundStyle(.tagEmergency)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .background(
                    .tagEmergency.opacity(0.08),
                    in: RoundedRectangle(cornerRadius: 14, style: .continuous)
                )
            }
            .buttonStyle(.plain)
        }
        .padding(.top, 8)
    }
}

#Preview {
    NavigationStack {
        ContactDetailView(
            contact: Contact.samples[0],
            viewModel: ContactsViewModel()
        )
    }
}
