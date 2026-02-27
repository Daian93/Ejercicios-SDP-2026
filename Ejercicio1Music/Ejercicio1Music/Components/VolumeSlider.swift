//
//  VolumeSlider.swift
//  Ejercicio1Music
//
//  Created by Diana Rammal Sansón on 31/10/25.
//

import SwiftUI

struct VolumeSlider: View {
    @Binding var volume: Double

    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "speaker.fill")
                .foregroundStyle(.gray.opacity(0.5))

            Slider(value: $volume, in: 0...100, step: 1)
                .frame(width: 260)
                .tint(.white.opacity(0.9))
                .accessibilityLabel("Volumen")
                .accessibilityValue("\(Int(volume)) por ciento")

            Image(systemName: "speaker.wave.2.fill")
                .foregroundStyle(.gray.opacity(0.5))
        }
    }
}

#Preview {
    ZStack {
        Color.black
        VolumeSlider(volume: .constant(50))
    }
}
