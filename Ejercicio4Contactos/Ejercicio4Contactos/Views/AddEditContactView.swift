//
//  AddEditContactView.swift
//  Ejercicio4Contactos
//
//  Created by Diana Rammal Sansón on 2/2/26.
//

import SwiftUI

// MARK: - AddEditContactView
struct AddEditContactView: View {
    let viewModel: ContactsViewModel
    let contact: Contact?

    @Environment(\.dismiss) private var dismiss

    // Form state
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var company: String = ""
    @State private var jobTitle: String = ""
    @State private var notes: String = ""
    @State private var birthday: Date = Date()
    @State private var hasBirthday: Bool = false
    @State private var isFavorite: Bool = false
    @State private var tag: ContactTag = .other
    @State private var avatarGradientIndex: Int = 0

    @State private var phones: [PhoneEntry] = [
        PhoneEntry(label: "Móvil", number: "")
    ]
    @State private var emails: [EmailEntry] = [
        EmailEntry(label: "Personal", address: "")
    ]
    @State private var addresses: [AddressEntry] = []
    @State private var socialLinks: [SocialLink] = []

    @State private var showValidationError: Bool = false

    private var isEditing: Bool { contact != nil }
    private var title: String {
        isEditing ? "Editar contacto" : "Nuevo contacto"
    }

    private var formIsValid: Bool {
        !firstName.trimmingCharacters(in: .whitespaces).isEmpty
    }

    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBackground.ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 20) {
                        // Avatar picker + name
                        AvatarPickerSection(
                            firstName: $firstName,
                            lastName: $lastName,
                            gradientIndex: $avatarGradientIndex,
                            isFavorite: $isFavorite,
                            tag: $tag
                        )

                        // Basic info
                        FormSection(
                            title: "Información básica",
                            icon: "person.fill"
                        ) {
                            FormTextField(
                                icon: "person.fill",
                                iconColor: .brandPrimary,
                                placeholder: "Nombre *",
                                text: $firstName
                            )
                            FormTextField(
                                icon: "person.fill",
                                iconColor: .brandPrimary,
                                placeholder: "Apellidos",
                                text: $lastName
                            )
                            FormTextField(
                                icon: "building.2.fill",
                                iconColor: .tagWork,
                                placeholder: "Empresa",
                                text: $company
                            )
                            FormTextField(
                                icon: "briefcase.fill",
                                iconColor: .tagWork,
                                placeholder: "Cargo",
                                text: $jobTitle
                            )
                        }

                        // Phones
                        DynamicListSection(
                            title: "Teléfonos",
                            icon: "phone.fill",
                            color: .tagWork,
                            items: $phones,
                            addLabel: "Añadir teléfono",
                            makeNew: { PhoneEntry(label: "Móvil", number: "") },
                            rowContent: { binding in
                                PhoneRowField(entry: binding)
                            }
                        )

                        // Emails
                        DynamicListSection(
                            title: "Correos",
                            icon: "envelope.fill",
                            color: .brandPrimary,
                            items: $emails,
                            addLabel: "Añadir correo",
                            makeNew: {
                                EmailEntry(label: "Personal", address: "")
                            },
                            rowContent: { binding in
                                EmailRowField(entry: binding)
                            }
                        )

                        // Addresses
                        DynamicListSection(
                            title: "Direcciones",
                            icon: "map.fill",
                            color: .tagFamily,
                            items: $addresses,
                            addLabel: "Añadir dirección",
                            makeNew: {
                                AddressEntry(
                                    label: "Casa",
                                    street: "",
                                    city: "",
                                    postalCode: "",
                                    country: "España"
                                )
                            },
                            rowContent: { binding in
                                AddressRowField(entry: binding)
                            }
                        )

                        // Social
                        DynamicListSection(
                            title: "Redes sociales",
                            icon: "network",
                            color: .brandSecondary,
                            items: $socialLinks,
                            addLabel: "Añadir red social",
                            makeNew: {
                                SocialLink(platform: .instagram, handle: "")
                            },
                            rowContent: { binding in
                                SocialLinkRowField(entry: binding)
                            }
                        )

                        // Birthday
                        BirthdaySection(
                            hasBirthday: $hasBirthday,
                            birthday: $birthday
                        )

                        // Notes
                        NotesFormSection(notes: $notes)

                        // Validation hint
                        if showValidationError {
                            Text("El nombre es obligatorio.")
                                .font(.system(size: 13, weight: .medium))
                                .foregroundStyle(.tagEmergency)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.horizontal, 16)
                        }

                        Spacer(minLength: 30)
                    }
                    .padding(.top, 8)
                }
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancelar") { dismiss() }
                        .foregroundStyle(.textSecondary)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(isEditing ? "Guardar" : "Añadir") {
                        saveContact()
                    }
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(
                        formIsValid ? .brandPrimary : .textTertiary
                    )
                }
            }
        }
        .onAppear { populateIfEditing() }
    }

    // MARK: - Populate form when editing
    private func populateIfEditing() {
        guard let c = contact else { return }
        firstName = c.firstName
        lastName = c.lastName
        company = c.company
        jobTitle = c.jobTitle
        notes = c.notes
        isFavorite = c.isFavorite
        tag = c.tag
        avatarGradientIndex = c.avatarGradientIndex
        phones =
            c.phones.isEmpty
            ? [PhoneEntry(label: "Móvil", number: "")] : c.phones
        emails =
            c.emails.isEmpty
            ? [EmailEntry(label: "Personal", address: "")] : c.emails
        addresses = c.addresses
        socialLinks = c.socialLinks
        if let bday = c.birthday {
            hasBirthday = true
            birthday = bday
        }
    }

    // MARK: - Save
    private func saveContact() {
        guard formIsValid else {
            showValidationError = true
            return
        }
        let newContact = Contact(
            id: contact?.id ?? UUID(),
            firstName: firstName.trimmingCharacters(in: .whitespaces),
            lastName: lastName.trimmingCharacters(in: .whitespaces),
            company: company.trimmingCharacters(in: .whitespaces),
            jobTitle: jobTitle.trimmingCharacters(in: .whitespaces),
            notes: notes.trimmingCharacters(in: .whitespaces),
            birthday: hasBirthday ? birthday : nil,
            isFavorite: isFavorite,
            tag: tag,
            avatarGradientIndex: avatarGradientIndex,
            phones: phones.filter { !$0.number.isEmpty },
            emails: emails.filter { !$0.address.isEmpty },
            addresses: addresses.filter { !$0.street.isEmpty },
            socialLinks: socialLinks.filter { !$0.handle.isEmpty }
        )
        if isEditing {
            viewModel.updateContact(newContact)
        } else {
            viewModel.addContact(newContact)
        }
        dismiss()
    }
}

// MARK: - Avatar Picker Section
private struct AvatarPickerSection: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var gradientIndex: Int
    @Binding var isFavorite: Bool
    @Binding var tag: ContactTag

    private var previewContact: Contact {
        Contact(
            firstName: firstName.isEmpty ? "?" : firstName,
            lastName: lastName,
            company: "",
            jobTitle: "",
            notes: "",
            isFavorite: isFavorite,
            tag: tag,
            avatarGradientIndex: gradientIndex,
            phones: [],
            emails: [],
            addresses: [],
            socialLinks: []
        )
    }

    var body: some View {
        VStack(spacing: 14) {
            // Avatar preview
            AvatarViewLarge(contact: previewContact, size: 88)
                .animation(.spring(duration: 0.3), value: gradientIndex)

            // Gradient color picker
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(0..<AvatarGradient.allCases.count, id: \.self) {
                        idx in
                        Circle()
                            .fill(AvatarGradient.allCases[idx].gradient)
                            .frame(width: 30, height: 30)
                            .overlay(
                                Circle()
                                    .strokeBorder(
                                        .white,
                                        lineWidth: gradientIndex == idx ? 3 : 0
                                    )
                            )
                            .shadow(
                                color: .black.opacity(0.15),
                                radius: 4,
                                x: 0,
                                y: 2
                            )
                            .onTapGesture { gradientIndex = idx }
                            .animation(
                                .spring(duration: 0.2),
                                value: gradientIndex
                            )
                    }
                }
                .padding(.horizontal, 20)
            }

            // Tag picker
            VStack(alignment: .leading, spacing: 6) {
                Text("CATEGORÍA")
                    .font(.system(size: 11, weight: .bold, design: .rounded))
                    .foregroundStyle(.textTertiary)
                    .kerning(0.8)
                    .padding(.horizontal, 16)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(ContactTag.allCases) { t in
                            Button {
                                withAnimation(.spring(duration: 0.2)) {
                                    tag = t
                                }
                            } label: {
                                HStack(spacing: 5) {
                                    Image(systemName: t.icon)
                                        .font(
                                            .system(size: 11, weight: .semibold)
                                        )
                                    Text(t.rawValue)
                                        .font(
                                            .system(
                                                size: 12,
                                                weight: .semibold,
                                                design: .rounded
                                            )
                                        )
                                }
                                .padding(.horizontal, 12)
                                .padding(.vertical, 7)
                                .background(
                                    Capsule()
                                        .fill(
                                            tag == t
                                                ? t.color : Color.surfaceLight
                                        )
                                )
                                .foregroundStyle(
                                    tag == t ? .white : .textSecondary
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }

            // Favorite toggle
            Button {
                withAnimation(.spring(duration: 0.25)) { isFavorite.toggle() }
            } label: {
                HStack(spacing: 6) {
                    Image(systemName: isFavorite ? "star.fill" : "star")
                        .font(.system(size: 14, weight: .semibold))
                    Text(
                        isFavorite
                            ? "Marcado como favorito" : "Marcar como favorito"
                    )
                    .font(
                        .system(size: 13, weight: .semibold, design: .rounded)
                    )
                }
                .foregroundStyle(isFavorite ? .brandAccent : .textSecondary)
                .padding(.horizontal, 18)
                .padding(.vertical, 8)
                .background(
                    Capsule()
                        .fill(
                            isFavorite
                                ? Color.brandAccent.opacity(0.12)
                                : Color.surfaceLight
                        )
                )
            }
            .buttonStyle(.plain)
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(
            .cardBackground,
            in: RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
        .shadow(color: .black.opacity(0.04), radius: 8, x: 0, y: 2)
        .padding(.horizontal, 16)
    }
}

// MARK: - Form Section Container
private struct FormSection<Content: View>: View {
    let title: String
    let icon: String
    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeaderView(title: title, icon: icon)
                .padding(.horizontal, 16)
            VStack(spacing: 1) {
                content
            }
            .background(
                .cardBackground,
                in: RoundedRectangle(cornerRadius: 16, style: .continuous)
            )
            .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
            .padding(.horizontal, 16)
        }
    }
}

// MARK: - FormTextField
private struct FormTextField: View {
    let icon: String
    let iconColor: Color
    let placeholder: String
    @Binding var text: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(iconColor)
                .frame(width: 22)
                .padding(.leading, 16)

            TextField(placeholder, text: $text)
                .font(.system(size: 15))
                .foregroundStyle(.textPrimary)
                .padding(.vertical, 13)

            Spacer()
        }
        .background(.cardBackground)
        Divider().padding(.leading, 50)
    }
}

// MARK: - Dynamic List Section
private struct DynamicListSection<
    Item: Identifiable & Equatable,
    RowContent: View
>: View {
    let title: String
    let icon: String
    let color: Color
    @Binding var items: [Item]
    let addLabel: String
    let makeNew: () -> Item
    @ViewBuilder var rowContent: (Binding<Item>) -> RowContent

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeaderView(title: title, icon: icon)
                .padding(.horizontal, 16)

            VStack(spacing: 1) {
                ForEach($items) { $item in
                    rowContent($item)
                    Divider().padding(.leading, 50)
                }

                Button {
                    withAnimation { items.append(makeNew()) }
                } label: {
                    HStack(spacing: 10) {
                        ZStack {
                            Circle()
                                .fill(color.opacity(0.15))
                                .frame(width: 28, height: 28)
                            Image(systemName: "plus")
                                .font(.system(size: 13, weight: .bold))
                                .foregroundStyle(color)
                        }
                        .padding(.leading, 14)
                        Text(addLabel)
                            .font(.system(size: 15, weight: .medium))
                            .foregroundStyle(color)
                        Spacer()
                    }
                    .padding(.vertical, 12)
                    .background(.cardBackground)
                }
                .buttonStyle(.plain)
            }
            .background(
                .cardBackground,
                in: RoundedRectangle(cornerRadius: 16, style: .continuous)
            )
            .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
            .padding(.horizontal, 16)
        }
    }
}

// MARK: - Phone Row Field
private struct PhoneRowField: View {
    @Binding var entry: PhoneEntry

    private let labels = ["Móvil", "Casa", "Trabajo", "Otro"]

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "phone.fill")
                .font(.system(size: 14))
                .foregroundStyle(.tagWork)
                .frame(width: 22)
                .padding(.leading, 16)

            Menu {
                ForEach(labels, id: \.self) { lbl in
                    Button(lbl) { entry.label = lbl }
                }
            } label: {
                HStack(spacing: 4) {
                    Text(entry.label)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.textSecondary)
                    Image(systemName: "chevron.down")
                        .font(.system(size: 10))
                        .foregroundStyle(.textTertiary)
                }
            }

            TextField("Número", text: $entry.number)
                .font(.system(size: 15))
                .keyboardType(.phonePad)
                .foregroundStyle(.textPrimary)
                .padding(.vertical, 13)
        }
        .background(.cardBackground)
    }
}

// MARK: - Email Row Field
private struct EmailRowField: View {
    @Binding var entry: EmailEntry

    private let labels = ["Personal", "Trabajo", "Otro"]

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "envelope.fill")
                .font(.system(size: 14))
                .foregroundStyle(.brandPrimary)
                .frame(width: 22)
                .padding(.leading, 16)

            Menu {
                ForEach(labels, id: \.self) { lbl in
                    Button(lbl) { entry.label = lbl }
                }
            } label: {
                HStack(spacing: 4) {
                    Text(entry.label)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.textSecondary)
                    Image(systemName: "chevron.down")
                        .font(.system(size: 10))
                        .foregroundStyle(.textTertiary)
                }
            }

            TextField("Dirección de correo", text: $entry.address)
                .font(.system(size: 15))
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .foregroundStyle(.textPrimary)
                .padding(.vertical, 13)
        }
        .background(.cardBackground)
    }
}

// MARK: - Address Row Field
private struct AddressRowField: View {
    @Binding var entry: AddressEntry

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 10) {
                Image(systemName: "mappin.circle.fill")
                    .font(.system(size: 14))
                    .foregroundStyle(.tagFamily)
                    .frame(width: 22)
                    .padding(.leading, 16)
                TextField("Calle y número", text: $entry.street)
                    .font(.system(size: 15))
                    .foregroundStyle(.textPrimary)
                    .padding(.vertical, 10)
            }
            Divider().padding(.leading, 50)
            HStack(spacing: 0) {
                TextField("Ciudad", text: $entry.city)
                    .font(.system(size: 15))
                    .foregroundStyle(.textPrimary)
                    .padding(.vertical, 10)
                    .padding(.leading, 50)
                Divider().frame(height: 30)
                TextField("C.P.", text: $entry.postalCode)
                    .font(.system(size: 15))
                    .foregroundStyle(.textPrimary)
                    .padding(.vertical, 10)
                    .padding(.leading, 12)
                    .frame(maxWidth: 90)
            }
            Divider().padding(.leading, 50)
            TextField("País", text: $entry.country)
                .font(.system(size: 15))
                .foregroundStyle(.textPrimary)
                .padding(.vertical, 10)
                .padding(.leading, 50)
        }
        .background(.cardBackground)
    }
}

// MARK: - Social Link Row Field
private struct SocialLinkRowField: View {
    @Binding var entry: SocialLink

    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: entry.platform.icon)
                .font(.system(size: 14))
                .foregroundStyle(.brandSecondary)
                .frame(width: 22)
                .padding(.leading, 16)

            Menu {
                ForEach(SocialLink.SocialPlatform.allCases, id: \.self) {
                    platform in
                    Button(platform.rawValue) { entry.platform = platform }
                }
            } label: {
                HStack(spacing: 4) {
                    Text(entry.platform.rawValue)
                        .font(.system(size: 13, weight: .medium))
                        .foregroundStyle(.textSecondary)
                    Image(systemName: "chevron.down")
                        .font(.system(size: 10))
                        .foregroundStyle(.textTertiary)
                }
            }

            TextField("Usuario / handle", text: $entry.handle)
                .font(.system(size: 15))
                .autocapitalization(.none)
                .foregroundStyle(.textPrimary)
                .padding(.vertical, 13)
        }
        .background(.cardBackground)
    }
}

// MARK: - Birthday Section
private struct BirthdaySection: View {
    @Binding var hasBirthday: Bool
    @Binding var birthday: Date

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeaderView(title: "Cumpleaños", icon: "gift.fill")
                .padding(.horizontal, 16)

            VStack(spacing: 0) {
                Toggle(isOn: $hasBirthday.animation()) {
                    HStack(spacing: 12) {
                        Image(systemName: "gift.fill")
                            .font(.system(size: 14))
                            .foregroundStyle(.brandAccent)
                            .frame(width: 22)
                        Text("Tiene cumpleaños")
                            .font(.system(size: 15))
                            .foregroundStyle(.textPrimary)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(.cardBackground)
                .tint(.brandAccent)

                if hasBirthday {
                    Divider().padding(.leading, 50)
                    DatePicker(
                        "Fecha",
                        selection: $birthday,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(.compact)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(.cardBackground)
                    .tint(.brandPrimary)
                }
            }
            .background(
                .cardBackground,
                in: RoundedRectangle(cornerRadius: 16, style: .continuous)
            )
            .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
            .padding(.horizontal, 16)
        }
    }
}

// MARK: - Notes Form Section
private struct NotesFormSection: View {
    @Binding var notes: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            SectionHeaderView(title: "Notas", icon: "note.text")
                .padding(.horizontal, 16)

            ZStack(alignment: .topLeading) {
                if notes.isEmpty {
                    Text("Añade una nota sobre este contacto…")
                        .font(.system(size: 15))
                        .foregroundStyle(.textTertiary)
                        .padding(.top, 14)
                        .padding(.leading, 16)
                }
                TextEditor(text: $notes)
                    .font(.system(size: 15))
                    .foregroundStyle(.textPrimary)
                    .frame(minHeight: 90)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 8)
                    .scrollContentBackground(.hidden)
            }
            .background(
                .cardBackground,
                in: RoundedRectangle(cornerRadius: 16, style: .continuous)
            )
            .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 2)
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    AddEditContactView(viewModel: ContactsViewModel(), contact: nil)
}
