//
//  BottomToolbar.swift
//  Ejercicio1Music
//
//  Created by Diana Rammal Sansón on 31/10/25.
//

import SwiftUI

struct BottomToolbar: View {
    var body: some View {
        HStack(spacing: 45) {
            Button {
                // Sound output action
            } label: {
                Image(systemName: "speaker.wave.2.fill")
                    .font(.title)
                    .foregroundStyle(.white.opacity(0.7))
            }

            Button {
                // Shuffle action
            } label: {
                Image(systemName: "shuffle")
                    .font(.largeTitle)
                    .foregroundStyle(.white.opacity(0.7))
            }

            Button {
                // Repeat action
            } label: {
                Image(systemName: "repeat")
                    .font(.title2)
                    .foregroundStyle(.white.opacity(0.7))
            }
        }
        .frame(width: 330, height: 90)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(.white.opacity(0.1))
        )
    }
}

#Preview {
    ZStack {
        Color.black
        BottomToolbar()
    }
}
