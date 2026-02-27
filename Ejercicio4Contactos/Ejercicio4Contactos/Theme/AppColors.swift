//
//  AppColors.swift
//  Ejercicio4Contactos
//
//  Created by Diana Rammal Sansón on 2/2/26.
//

import SwiftUI

// MARK: - App Color Palette
extension Color {
    // Primary brand colors
    static let brandPrimary = Color(red: 0.33, green: 0.49, blue: 0.92)  // Soft indigo
    static let brandSecondary = Color(red: 0.56, green: 0.35, blue: 0.90)  // Soft violet
    static let brandAccent = Color(red: 0.95, green: 0.46, blue: 0.42)  // Coral

    // Backgrounds
    static let appBackground = Color(red: 0.96, green: 0.96, blue: 0.98)
    static let cardBackground = Color.white
    static let cardBackgroundDark = Color(red: 0.14, green: 0.14, blue: 0.18)

    // Surfaces
    static let surfaceLight = Color(red: 0.94, green: 0.94, blue: 0.97)
    static let surfaceMedium = Color(red: 0.88, green: 0.88, blue: 0.95)

    // Tag colors
    static let tagWork = Color(red: 0.20, green: 0.60, blue: 0.86)
    static let tagFamily = Color(red: 0.40, green: 0.78, blue: 0.60)
    static let tagFriend = Color(red: 0.97, green: 0.67, blue: 0.28)
    static let tagEmergency = Color(red: 0.95, green: 0.38, blue: 0.38)
    static let tagOther = Color(red: 0.65, green: 0.65, blue: 0.72)

    // Text
    static let textPrimary = Color(red: 0.13, green: 0.13, blue: 0.20)
    static let textSecondary = Color(red: 0.50, green: 0.50, blue: 0.58)
    static let textTertiary = Color(red: 0.72, green: 0.72, blue: 0.78)

    // Separator
    static let separatorLight = Color(red: 0.88, green: 0.88, blue: 0.94)
}

// MARK: - ShapeStyle bridge
// Exposes all custom Color members as ShapeStyle so dot-syntax works in foregroundStyle(_:)
extension ShapeStyle where Self == Color {
    static var brandPrimary: Color { .brandPrimary }
    static var brandSecondary: Color { .brandSecondary }
    static var brandAccent: Color { .brandAccent }

    static var appBackground: Color { .appBackground }
    static var cardBackground: Color { .cardBackground }
    static var cardBackgroundDark: Color { .cardBackgroundDark }

    static var surfaceLight: Color { .surfaceLight }
    static var surfaceMedium: Color { .surfaceMedium }

    static var tagWork: Color { .tagWork }
    static var tagFamily: Color { .tagFamily }
    static var tagFriend: Color { .tagFriend }
    static var tagEmergency: Color { .tagEmergency }
    static var tagOther: Color { .tagOther }

    static var textPrimary: Color { .textPrimary }
    static var textSecondary: Color { .textSecondary }
    static var textTertiary: Color { .textTertiary }

    static var separatorLight: Color { .separatorLight }
}

// MARK: - Avatar Gradient Palettes
extension LinearGradient {
    static let avatarBlue = LinearGradient(
        colors: [
            Color(red: 0.33, green: 0.49, blue: 0.92),
            Color(red: 0.22, green: 0.35, blue: 0.78),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let avatarPurple = LinearGradient(
        colors: [
            Color(red: 0.68, green: 0.44, blue: 0.94),
            Color(red: 0.44, green: 0.24, blue: 0.82),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let avatarCoral = LinearGradient(
        colors: [
            Color(red: 0.97, green: 0.58, blue: 0.46),
            Color(red: 0.88, green: 0.34, blue: 0.34),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let avatarMint = LinearGradient(
        colors: [
            Color(red: 0.34, green: 0.82, blue: 0.72),
            Color(red: 0.18, green: 0.66, blue: 0.56),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let avatarSunset = LinearGradient(
        colors: [
            Color(red: 0.98, green: 0.72, blue: 0.34),
            Color(red: 0.94, green: 0.46, blue: 0.28),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let avatarRose = LinearGradient(
        colors: [
            Color(red: 0.96, green: 0.44, blue: 0.64),
            Color(red: 0.80, green: 0.24, blue: 0.48),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let avatarSlate = LinearGradient(
        colors: [
            Color(red: 0.52, green: 0.58, blue: 0.76),
            Color(red: 0.36, green: 0.42, blue: 0.62),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let avatarEmerald = LinearGradient(
        colors: [
            Color(red: 0.22, green: 0.76, blue: 0.52),
            Color(red: 0.10, green: 0.58, blue: 0.38),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}

// MARK: - Gradient helpers
enum AvatarGradient: Int, CaseIterable {
    case blue, purple, coral, mint, sunset, rose, slate, emerald

    var gradient: LinearGradient {
        switch self {
        case .blue: return .avatarBlue
        case .purple: return .avatarPurple
        case .coral: return .avatarCoral
        case .mint: return .avatarMint
        case .sunset: return .avatarSunset
        case .rose: return .avatarRose
        case .slate: return .avatarSlate
        case .emerald: return .avatarEmerald
        }
    }
}
