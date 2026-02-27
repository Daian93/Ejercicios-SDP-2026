//
//  PlaybackControls.swift
//  Ejercicio1Music
//
//  Created by Diana Rammal Sansón on 31/10/25.
//

import SwiftUI

struct PlaybackControls: View {
    @Binding var isPlaying: Bool

    var body: some View {
        HStack(spacing: 18) {
            Button {
                // Backward action
            } label: {
                Image(systemName: "backward.fill")
                    .font(.system(size: 20))
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)

            Button {
                isPlaying.toggle()
            } label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 45))
                    .frame(width: 65, height: 65)
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)
            .animation(.easeInOut(duration: 0.2), value: isPlaying)

            Button {
                // Forward action
            } label: {
                Image(systemName: "forward.fill")
                    .font(.system(size: 20))
                    .frame(width: 40, height: 40)
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)
        }
    }
}

#Preview {
    ZStack {
        Color.black
        PlaybackControls(isPlaying: .constant(false))
    }
}
