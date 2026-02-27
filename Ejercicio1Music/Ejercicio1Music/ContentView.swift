//
//  ContentView.swift
//  Ejercicio1Music
//
//  Created by Diana Rammal Sansón on 31/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var volumeLevel: Double = 50
    @State private var isPlaying: Bool = false
    @State private var selectedTab: String = "Música"

    var body: some View {
        ZStack {
            // Background with gradient and sun
            Background()

            // Musical note
            MusicNote()

            // Controls and tabs
            VStack(spacing: 0) {
                Text("Música")
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(.top, 16)

                Spacer()

                VStack(spacing: 20) {
                    ProgressBar(progress: 0.7, elapsed: "0:50", remaining: "2:23")
                        .padding(.top, 10)

                    CategoryTabs(selectedTab: $selectedTab)

                    PlaybackControls(isPlaying: $isPlaying)

                    VolumeSlider(volume: $volumeLevel)

                    BottomToolbar()
                        .padding(.bottom, 16)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    ContentView()
}
