//
//  ContactsViewModel.swift
//  Ejercicio4Contactos
//
//  Created by Diana Rammal Sansón on 2/2/26.
//

import Foundation
import Observation

// MARK: - Filter Option
enum ContactFilter: String, CaseIterable, Identifiable {
    case all = "Todos"
    case favorites = "Favoritos"
    case work = "Trabajo"
    case family = "Familia"
    case friend = "Amigos"
    case emergency = "Emergencia"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .all: return "person.2.fill"
        case .favorites: return "star.fill"
        case .work: return "briefcase.fill"
        case .family: return "house.fill"
        case .friend: return "heart.fill"
        case .emergency: return "cross.case.fill"
        }
    }

    var correspondingTag: ContactTag? {
        switch self {
        case .all, .favorites: return nil
        case .work: return .work
        case .family: return .family
        case .friend: return .friend
        case .emergency: return .emergency
        }
    }
}

// MARK: - Sort Option
enum ContactSort: String, CaseIterable, Identifiable {
    case firstName = "Nombre"
    case lastName = "Apellido"
    case recentlyAdded = "Reciente"

    var id: String { rawValue }
}

// MARK: - ViewModel
@Observable
@MainActor
final class ContactsViewModel {

    // MARK: Stored state
    var contacts: [Contact] = Contact.samples
    var searchText: String = ""
    var selectedFilter: ContactFilter = .all
    var selectedSort: ContactSort = .firstName
    var showOnlyWithBirthday: Bool = false

    // MARK: Sheet / navigation state
    var contactToEdit: Contact? = nil
    var isAddingContact: Bool = false
    var contactToDelete: Contact? = nil
    var showDeleteConfirmation: Bool = false

    // MARK: - Filtered & sorted contacts
    var filteredContacts: [Contact] {
        var result = contacts

        // Filter by tag / favorites
        switch selectedFilter {
        case .all:
            break
        case .favorites:
            result = result.filter { $0.isFavorite }
        default:
            if let tag = selectedFilter.correspondingTag {
                result = result.filter { $0.tag == tag }
            }
        }

        // Filter by birthday
        if showOnlyWithBirthday {
            result = result.filter { $0.birthday != nil }
        }

        // Search
        if !searchText.isEmpty {
            let query = searchText.lowercased()
            result = result.filter {
                $0.fullName.lowercased().contains(query)
                    || $0.company.lowercased().contains(query)
                    || $0.jobTitle.lowercased().contains(query)
                    || $0.phones.contains { $0.number.contains(query) }
                    || $0.emails.contains {
                        $0.address.lowercased().contains(query)
                    }
            }
        }

        // Sort
        switch selectedSort {
        case .firstName:
            result.sort {
                $0.firstName.localizedCaseInsensitiveCompare($1.firstName)
                    == .orderedAscending
            }
        case .lastName:
            result.sort {
                $0.lastName.localizedCaseInsensitiveCompare($1.lastName)
                    == .orderedAscending
            }
        case .recentlyAdded:
            break  // contacts array already ordered by insertion
        }

        return result
    }

    // MARK: - Grouped contacts (alphabetical sections)
    var groupedContacts: [(key: String, value: [Contact])] {
        let contacts = filteredContacts
        let grouped = Dictionary(grouping: contacts) { contact -> String in
            let sortLetter: String
            switch selectedSort {
            case .firstName, .recentlyAdded:
                sortLetter = String(contact.firstName.prefix(1)).uppercased()
            case .lastName:
                sortLetter = String(contact.lastName.prefix(1)).uppercased()
            }
            return sortLetter.isEmpty ? "#" : sortLetter
        }
        return grouped.sorted { $0.key < $1.key }
    }

    // MARK: - Stats
    var totalCount: Int { contacts.count }
    var favoritesCount: Int { contacts.filter { $0.isFavorite }.count }
    var upcomingBirthdays: [Contact] {
        let today = Calendar.current.startOfDay(for: Date())
        return
            contacts
            .filter { contact in
                guard let bday = contact.birthday else { return false }
                var comps = Calendar.current.dateComponents(
                    [.month, .day],
                    from: bday
                )
                comps.year = Calendar.current.component(.year, from: today)
                guard let thisYear = Calendar.current.date(from: comps) else {
                    return false
                }
                let target =
                    thisYear >= today
                    ? thisYear
                    : Calendar.current.date(
                        byAdding: .year,
                        value: 1,
                        to: thisYear
                    )!
                let diff =
                    Calendar.current.dateComponents(
                        [.day],
                        from: today,
                        to: target
                    ).day ?? 0
                return diff <= 30
            }
            .sorted {
                let bday0 = normalizedBirthdayDate($0.birthday!)
                let bday1 = normalizedBirthdayDate($1.birthday!)
                return bday0 < bday1
            }
    }

    private func normalizedBirthdayDate(_ date: Date) -> Date {
        let today = Calendar.current.startOfDay(for: Date())
        var comps = Calendar.current.dateComponents([.month, .day], from: date)
        comps.year = Calendar.current.component(.year, from: today)
        let thisYear = Calendar.current.date(from: comps)!
        return thisYear >= today
            ? thisYear
            : Calendar.current.date(byAdding: .year, value: 1, to: thisYear)!
    }

    // MARK: - CRUD operations
    func addContact(_ contact: Contact) {
        contacts.insert(contact, at: 0)
    }

    func updateContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id })
        else { return }
        contacts[index] = contact
    }

    func deleteContact(_ contact: Contact) {
        contacts.removeAll { $0.id == contact.id }
    }

    func deleteContacts(at offsets: IndexSet, in group: [Contact]) {
        let idsToDelete = offsets.map { group[$0].id }
        contacts.removeAll { idsToDelete.contains($0.id) }
    }

    func toggleFavorite(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id })
        else { return }
        contacts[index].isFavorite.toggle()
    }

    // MARK: - Sheet helpers
    func startAdding() {
        isAddingContact = true
    }

    func startEditing(_ contact: Contact) {
        contactToEdit = contact
    }

    func requestDelete(_ contact: Contact) {
        contactToDelete = contact
        showDeleteConfirmation = true
    }

    func confirmDelete() {
        if let contact = contactToDelete {
            deleteContact(contact)
        }
        contactToDelete = nil
        showDeleteConfirmation = false
    }
}
