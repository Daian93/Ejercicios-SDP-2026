//
//  Contact.swift
//  Ejercicio4Contactos
//
//  Created by Diana Rammal Sansón on 2/2/26.
//

import Foundation

// MARK: - Contact Tag
enum ContactTag: String, CaseIterable, Codable, Identifiable {
    case work = "Trabajo"
    case family = "Familia"
    case friend = "Amigo"
    case emergency = "Emergencia"
    case other = "Otro"

    var id: String { rawValue }

    var icon: String {
        switch self {
        case .work: return "briefcase.fill"
        case .family: return "house.fill"
        case .friend: return "heart.fill"
        case .emergency: return "cross.case.fill"
        case .other: return "tag.fill"
        }
    }
}

// MARK: - Phone Entry
struct PhoneEntry: Identifiable, Codable, Equatable, Hashable {
    var id: UUID = UUID()
    var label: String  // e.g. "Móvil", "Casa", "Trabajo"
    var number: String
}

// MARK: - Email Entry
struct EmailEntry: Identifiable, Codable, Equatable, Hashable {
    var id: UUID = UUID()
    var label: String  // e.g. "Personal", "Trabajo"
    var address: String
}

// MARK: - Address Entry
struct AddressEntry: Identifiable, Codable, Equatable, Hashable {
    var id: UUID = UUID()
    var label: String
    var street: String
    var city: String
    var postalCode: String
    var country: String

    var formatted: String {
        [street, city, postalCode, country]
            .filter { !$0.isEmpty }
            .joined(separator: ", ")
    }
}

// MARK: - Social Link
struct SocialLink: Identifiable, Codable, Equatable, Hashable {
    var id: UUID = UUID()
    var platform: SocialPlatform
    var handle: String

    enum SocialPlatform: String, CaseIterable, Codable {
        case instagram = "Instagram"
        case twitter = "X (Twitter)"
        case linkedin = "LinkedIn"
        case github = "GitHub"
        case youtube = "YouTube"

        var icon: String {
            switch self {
            case .instagram: return "camera.fill"
            case .twitter: return "bird.fill"
            case .linkedin: return "network"
            case .github: return "chevron.left.forwardslash.chevron.right"
            case .youtube: return "play.rectangle.fill"
            }
        }
    }
}

// MARK: - Contact
struct Contact: Identifiable, Codable, Equatable, Hashable {
    var id: UUID = UUID()
    var firstName: String
    var lastName: String
    var company: String
    var jobTitle: String
    var notes: String
    var birthday: Date?
    var isFavorite: Bool = false
    var tag: ContactTag = .other
    var avatarGradientIndex: Int = 0

    var phones: [PhoneEntry]
    var emails: [EmailEntry]
    var addresses: [AddressEntry]
    var socialLinks: [SocialLink]

    // Computed
    var fullName: String {
        [firstName, lastName].filter { !$0.isEmpty }.joined(separator: " ")
    }

    var initials: String {
        let f = firstName.first.map(String.init) ?? ""
        let l = lastName.first.map(String.init) ?? ""
        return (f + l).uppercased()
    }

    var primaryPhone: String? { phones.first?.number }
    var primaryEmail: String? { emails.first?.address }

    // MARK: - Sample data
    static let samples: [Contact] = [
        Contact(
            firstName: "Ana",
            lastName: "García",
            company: "Diseño Studio",
            jobTitle: "UX Designer",
            notes: "Conocida de la conferencia de diseño en Madrid.",
            birthday: Calendar.current.date(
                from: DateComponents(year: 1992, month: 3, day: 14)
            ),
            isFavorite: true,
            tag: .work,
            avatarGradientIndex: 0,
            phones: [PhoneEntry(label: "Móvil", number: "+34 612 345 678")],
            emails: [
                EmailEntry(label: "Trabajo", address: "ana.garcia@studio.com")
            ],
            addresses: [
                AddressEntry(
                    label: "Trabajo",
                    street: "Calle Gran Vía 45",
                    city: "Madrid",
                    postalCode: "28013",
                    country: "España"
                )
            ],
            socialLinks: [
                SocialLink(platform: .instagram, handle: "@anadesign"),
                SocialLink(platform: .linkedin, handle: "ana-garcia-ux"),
            ]
        ),
        Contact(
            firstName: "Carlos",
            lastName: "López",
            company: "Tech Solutions SL",
            jobTitle: "iOS Developer",
            notes: "Compañero del bootcamp de SwiftUI.",
            birthday: Calendar.current.date(
                from: DateComponents(year: 1989, month: 7, day: 22)
            ),
            isFavorite: false,
            tag: .friend,
            avatarGradientIndex: 1,
            phones: [
                PhoneEntry(label: "Móvil", number: "+34 634 567 890"),
                PhoneEntry(label: "Trabajo", number: "+34 91 234 5678"),
            ],
            emails: [
                EmailEntry(label: "Personal", address: "carlos@gmail.com"),
                EmailEntry(label: "Trabajo", address: "carlos.lopez@tech.com"),
            ],
            addresses: [],
            socialLinks: [
                SocialLink(platform: .github, handle: "carloslopez-dev")
            ]
        ),
        Contact(
            firstName: "María",
            lastName: "Martínez",
            company: "",
            jobTitle: "",
            notes: "Hermana mayor. Cumpleaños en agosto.",
            birthday: Calendar.current.date(
                from: DateComponents(year: 1985, month: 8, day: 5)
            ),
            isFavorite: true,
            tag: .family,
            avatarGradientIndex: 5,
            phones: [PhoneEntry(label: "Móvil", number: "+34 645 678 901")],
            emails: [
                EmailEntry(
                    label: "Personal",
                    address: "maria.martinez@gmail.com"
                )
            ],
            addresses: [
                AddressEntry(
                    label: "Casa",
                    street: "Av. de la Constitución 12",
                    city: "Sevilla",
                    postalCode: "41001",
                    country: "España"
                )
            ],
            socialLinks: []
        ),
        Contact(
            firstName: "Luis",
            lastName: "Fernández",
            company: "Clínica Norte",
            jobTitle: "Médico de Familia",
            notes: "Médico de cabecera. Horario: L-V 9-17h.",
            birthday: nil,
            isFavorite: false,
            tag: .emergency,
            avatarGradientIndex: 2,
            phones: [
                PhoneEntry(label: "Consulta", number: "+34 91 456 7890"),
                PhoneEntry(label: "Urgencias", number: "112"),
            ],
            emails: [
                EmailEntry(
                    label: "Consulta",
                    address: "l.fernandez@clinicanorte.es"
                )
            ],
            addresses: [
                AddressEntry(
                    label: "Clínica",
                    street: "Calle de Alcalá 200",
                    city: "Madrid",
                    postalCode: "28028",
                    country: "España"
                )
            ],
            socialLinks: []
        ),
        Contact(
            firstName: "Sofía",
            lastName: "Ruiz",
            company: "Freelance",
            jobTitle: "Fotógrafa",
            notes: "Gran fotógrafa de bodas y eventos.",
            birthday: Calendar.current.date(
                from: DateComponents(year: 1995, month: 11, day: 30)
            ),
            isFavorite: false,
            tag: .work,
            avatarGradientIndex: 4,
            phones: [PhoneEntry(label: "Móvil", number: "+34 655 789 012")],
            emails: [
                EmailEntry(
                    label: "Trabajo",
                    address: "sofia.ruiz.foto@gmail.com"
                )
            ],
            addresses: [],
            socialLinks: [
                SocialLink(platform: .instagram, handle: "@sofiaruizfoto"),
                SocialLink(platform: .youtube, handle: "SofiaRuizPhoto"),
            ]
        ),
        Contact(
            firstName: "David",
            lastName: "Jiménez",
            company: "Universidad Complutense",
            jobTitle: "Profesor",
            notes: "Profesor de matemáticas. Muy buen amigo del máster.",
            birthday: Calendar.current.date(
                from: DateComponents(year: 1980, month: 4, day: 18)
            ),
            isFavorite: false,
            tag: .friend,
            avatarGradientIndex: 7,
            phones: [PhoneEntry(label: "Móvil", number: "+34 666 890 123")],
            emails: [
                EmailEntry(label: "Universidad", address: "d.jimenez@ucm.es")
            ],
            addresses: [],
            socialLinks: [
                SocialLink(platform: .twitter, handle: "@davidjimenez_mat")
            ]
        ),
        Contact(
            firstName: "Elena",
            lastName: "Torres",
            company: "Banco Santander",
            jobTitle: "Directora de Cuentas",
            notes: "Gestora bancaria personal.",
            birthday: nil,
            isFavorite: false,
            tag: .work,
            avatarGradientIndex: 3,
            phones: [PhoneEntry(label: "Oficina", number: "+34 91 567 8901")],
            emails: [
                EmailEntry(
                    label: "Banco",
                    address: "elena.torres@santander.com"
                )
            ],
            addresses: [
                AddressEntry(
                    label: "Oficina",
                    street: "Paseo de la Castellana 24",
                    city: "Madrid",
                    postalCode: "28046",
                    country: "España"
                )
            ],
            socialLinks: [
                SocialLink(platform: .linkedin, handle: "elena-torres-banking")
            ]
        ),
        Contact(
            firstName: "Pablo",
            lastName: "Sánchez",
            company: "",
            jobTitle: "",
            notes: "Primo. Vive en Barcelona.",
            birthday: Calendar.current.date(
                from: DateComponents(year: 1993, month: 1, day: 9)
            ),
            isFavorite: false,
            tag: .family,
            avatarGradientIndex: 6,
            phones: [PhoneEntry(label: "Móvil", number: "+34 677 901 234")],
            emails: [],
            addresses: [
                AddressEntry(
                    label: "Casa",
                    street: "Carrer de Balmes 100",
                    city: "Barcelona",
                    postalCode: "08008",
                    country: "España"
                )
            ],
            socialLinks: [
                SocialLink(platform: .instagram, handle: "@pablosanchez")
            ]
        ),
    ]
}
