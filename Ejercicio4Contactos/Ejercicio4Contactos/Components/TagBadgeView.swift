//
//  TagBadgeView.swift
//  Ejercicio4Contactos
//
//  Created by Diana Rammal Sansón on 2/2/26.
//

import SwiftUI

// MARK: - Tag Color mapping
extension ContactTag {
    var color: Color {
        switch self {
        case .work: return .tagWork
        case .family: return .tagFamily
        case .friend: return .tagFriend
        case .emergency: return .tagEmergency
        case .other: return .tagOther
        }
    }
}

// MARK: - TagBadgeView
struct TagBadgeView: View {
    let tag: ContactTag
    var compact: Bool = false

    var body: some View {
        HStack(spacing: 4) {
            Image(systemName: tag.icon)
                .font(.system(size: compact ? 9 : 11, weight: .semibold))
            if !compact {
                Text(tag.rawValue)
                    .font(
                        .system(size: 11, weight: .semibold, design: .rounded)
                    )
            }
        }
        .padding(.horizontal, compact ? 7 : 10)
        .padding(.vertical, compact ? 4 : 5)
        .background(tag.color.opacity(0.15), in: Capsule())
        .foregroundStyle(tag.color)
    }
}

#Preview {
    VStack(alignment: .leading, spacing: 8) {
        ForEach(ContactTag.allCases) { tag in
            HStack {
                TagBadgeView(tag: tag)
                TagBadgeView(tag: tag, compact: true)
            }
        }
    }
    .padding()
}
