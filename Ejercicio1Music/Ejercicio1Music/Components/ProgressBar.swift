//
//  ProgressBar.swift
//  Ejercicio1Music
//
//  Created by Diana Rammal Sansón on 31/10/25.
//

import SwiftUI

struct ProgressBar: View {
    var progress: Double = 0.7
    var elapsed: String = "0:00"
    var remaining: String = "2:23"

    private let gradientColors: [Color] = [
        .purple.opacity(0.7),
        .pink.opacity(0.7),
        .red.opacity(0.7)
    ]

    var body: some View {
        VStack(spacing: 6) {
            ProgressView(value: progress)
                .frame(width: 280, height: 6)
                .tint(.clear)
                .scaleEffect(y: 1.5, anchor: .center)
                .background(
                    LinearGradient(
                        colors: gradientColors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                    .mask(alignment: .center) {
                        ProgressView(value: progress)
                            .frame(width: 280)
                            .scaleEffect(y: 1.5, anchor: .center)
                    }
                )

            HStack {
                Text(elapsed)
                    .font(.caption)
                    .foregroundStyle(.gray.opacity(0.8))
                Spacer()
                Text(remaining)
                    .font(.caption)
                    .foregroundStyle(.gray.opacity(0.8))
            }
            .frame(width: 280)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        ProgressBar(progress: 0.7, elapsed: "0:50", remaining: "2:23")
    }
}
