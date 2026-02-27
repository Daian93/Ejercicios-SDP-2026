//
//  ContactListView.swift
//  Ejercicio4Contactos
//
//  Created by Diana Rammal Sansón on 2/2/26.
//

import SwiftUI

// MARK: - ContactListView
struct ContactListView: View {
    @Bindable var viewModel: ContactsViewModel
    @State private var selectedContact: Contact? = nil

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                Color.appBackground.ignoresSafeArea()
                scrollContent
            }
        }
        .sheet(isPresented: $viewModel.isAddingContact) {
            AddEditContactView(viewModel: viewModel, contact: nil)
        }
        .sheet(item: $viewModel.contactToEdit) { contact in
            AddEditContactView(viewModel: viewModel, contact: contact)
        }
        .confirmationDialog(
            "¿Eliminar contacto?",
            isPresented: $viewModel.showDeleteConfirmation,
            titleVisibility: .visible
        ) {
            Button("Eliminar", role: .destructive) {
                viewModel.confirmDelete()
            }
            Button("Cancelar", role: .cancel) {
                viewModel.contactToDelete = nil
            }
        } message: {
            if let name = viewModel.contactToDelete?.fullName {
                Text("Se eliminará \"\(name)\" permanentemente.")
            }
        }
    }

    // MARK: - Scroll Content
    @ViewBuilder
    private var scrollContent: some View {
        ScrollView {
            VStack(spacing: 0) {
                StatsHeaderView(viewModel: viewModel)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    .padding(.bottom, 4)

                if !viewModel.upcomingBirthdays.isEmpty {
                    BirthdaysStripView(contacts: viewModel.upcomingBirthdays)
                        .padding(.top, 12)
                }

                FilterStripView(viewModel: viewModel)
                    .padding(.top, 12)

                SortBarView(viewModel: viewModel)
                    .padding(.horizontal, 16)
                    .padding(.top, 8)

                contactsListSection
            }
        }
        .scrollDismissesKeyboard(.interactively)
        .navigationTitle("Contactos")
        .navigationBarTitleDisplayMode(.large)
        .searchable(
            text: $viewModel.searchText,
            prompt: "Buscar por nombre, empresa, email…"
        )
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    viewModel.startAdding()
                } label: {
                    Image(systemName: "person.badge.plus")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundStyle(.brandPrimary)
                }
            }
            ToolbarItem(placement: .topBarLeading) {
                BirthdayToggleButton(isOn: $viewModel.showOnlyWithBirthday)
            }
        }
        .navigationDestination(for: Contact.self) { contact in
            ContactDetailView(contact: contact, viewModel: viewModel)
        }
    }

    // MARK: - Contacts List Section
    @ViewBuilder
    private var contactsListSection: some View {
        if viewModel.filteredContacts.isEmpty {
            EmptyStateView(
                icon: "person.2",
                title: "Sin resultados",
                subtitle: "Prueba con otro nombre o cambia el filtro.",
                actionTitle: viewModel.searchText.isEmpty
                    ? "Añadir contacto" : nil,
                action: viewModel.searchText.isEmpty
                    ? { viewModel.startAdding() } : nil
            )
            .padding(.top, 40)
        } else {
            LazyVStack(spacing: 16, pinnedViews: .sectionHeaders) {
                ForEach(viewModel.groupedContacts, id: \.key) { group in
                    contactSection(group: group)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
            .padding(.bottom, 90)
        }
    }

    // MARK: - Contact Section
    @ViewBuilder
    private func contactSection(group: (key: String, value: [Contact]))
        -> some View
    {
        Section {
            VStack(spacing: 8) {
                ForEach(group.value) { contact in
                    contactRow(contact: contact)
                }
            }
        } header: {
            AlphabetSectionHeader(letter: group.key)
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
                .background(.appBackground)
        }
    }

    // MARK: - Contact Row
    @ViewBuilder
    private func contactRow(contact: Contact) -> some View {
        NavigationLink(value: contact) {
            ContactRowView(contact: contact)
        }
        .buttonStyle(.plain)
        .contextMenu {
            ContactContextMenu(contact: contact, viewModel: viewModel)
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            Button(role: .destructive) {
                viewModel.requestDelete(contact)
            } label: {
                Label("Eliminar", systemImage: "trash")
            }
        }
        .swipeActions(edge: .leading) {
            Button {
                viewModel.toggleFavorite(contact)
            } label: {
                Label(
                    contact.isFavorite ? "Quitar" : "Favorito",
                    systemImage: contact.isFavorite ? "star.slash" : "star.fill"
                )
            }
            .tint(.brandAccent)
        }
    }

}

// MARK: - Stats Header
private struct StatsHeaderView: View {
    let viewModel: ContactsViewModel

    var body: some View {
        HStack(spacing: 10) {
            StatBadge(
                icon: "person.2.fill",
                value: "\(viewModel.totalCount)",
                label: "Total",
                color: .brandPrimary
            )
            StatBadge(
                icon: "star.fill",
                value: "\(viewModel.favoritesCount)",
                label: "Favoritos",
                color: .brandAccent
            )
            StatBadge(
                icon: "gift.fill",
                value: "\(viewModel.upcomingBirthdays.count)",
                label: "Cumpleaños",
                color: .tagFamily
            )
        }
    }
}

// MARK: - Birthdays Strip
private struct BirthdaysStripView: View {
    let contacts: [Contact]

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            SectionHeaderView(title: "Próximos cumpleaños", icon: "gift.fill")
                .padding(.horizontal, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(contacts) { contact in
                        BirthdayCardView(contact: contact)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 4)
            }
        }
    }
}

// MARK: - Filter Strip
private struct FilterStripView: View {
    @Bindable var viewModel: ContactsViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(ContactFilter.allCases) { filter in
                    FilterChipView(
                        filter: filter,
                        isSelected: viewModel.selectedFilter == filter
                    ) {
                        withAnimation(.spring(duration: 0.25)) {
                            viewModel.selectedFilter = filter
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 2)
        }
    }
}

// MARK: - Sort Bar
private struct SortBarView: View {
    @Bindable var viewModel: ContactsViewModel

    var body: some View {
        HStack {
            Text(
                "\(viewModel.filteredContacts.count) contacto\(viewModel.filteredContacts.count == 1 ? "" : "s")"
            )
            .font(.system(size: 13, weight: .medium, design: .rounded))
            .foregroundStyle(.textSecondary)

            Spacer()

            Menu {
                ForEach(ContactSort.allCases) { sort in
                    Button {
                        withAnimation { viewModel.selectedSort = sort }
                    } label: {
                        Label(
                            sort.rawValue,
                            systemImage: viewModel.selectedSort == sort
                                ? "checkmark" : ""
                        )
                    }
                }
            } label: {
                HStack(spacing: 4) {
                    Image(systemName: "arrow.up.arrow.down")
                        .font(.system(size: 12, weight: .semibold))
                    Text("Ordenar")
                        .font(
                            .system(
                                size: 13,
                                weight: .semibold,
                                design: .rounded
                            )
                        )
                }
                .foregroundStyle(.brandPrimary)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(.brandPrimary.opacity(0.1), in: Capsule())
            }
        }
    }
}

// MARK: - Birthday Toggle Button
private struct BirthdayToggleButton: View {
    @Binding var isOn: Bool

    var body: some View {
        Button {
            withAnimation(.spring(duration: 0.25)) { isOn.toggle() }
        } label: {
            Image(systemName: isOn ? "gift.fill" : "gift")
                .font(.system(size: 17))
                .foregroundStyle(isOn ? .brandAccent : .textSecondary)
        }
    }
}

// MARK: - Contact Context Menu
private struct ContactContextMenu: View {
    let contact: Contact
    let viewModel: ContactsViewModel

    var body: some View {
        Group {
            Button {
                viewModel.startEditing(contact)
            } label: {
                Label("Editar", systemImage: "pencil")
            }

            Button {
                viewModel.toggleFavorite(contact)
            } label: {
                Label(
                    contact.isFavorite
                        ? "Quitar de favoritos" : "Añadir a favoritos",
                    systemImage: contact.isFavorite ? "star.slash" : "star"
                )
            }

            if let phone = contact.primaryPhone {
                Button {
                    openURL(
                        "tel://\(phone.replacingOccurrences(of: " ", with: ""))"
                    )
                } label: {
                    Label("Llamar", systemImage: "phone.fill")
                }
            }

            Divider()

            Button(role: .destructive) {
                viewModel.requestDelete(contact)
            } label: {
                Label("Eliminar", systemImage: "trash")
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

#Preview {
    ContactListView(viewModel: ContactsViewModel())
}
