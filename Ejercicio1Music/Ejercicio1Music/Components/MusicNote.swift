//
//  MusicNote.swift
//  Ejercicio1Music
//
//  Created by Diana Rammal Sansón on 31/10/25.
//

import SwiftUI

struct MusicNote: View {
    var body: some View {
        GeometryReader { geo in
            Image(.musicalnote)
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .position(x: geo.size.width / 2, y: geo.size.height * 0.32)
        }
    }
}

#Preview {
    ZStack {
        Background()
        MusicNote()
    }
}
