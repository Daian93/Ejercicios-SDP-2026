//
//  CategoryTabs.swift
//  Ejercicio1Music
//
//  Created by Diana Rammal Sansón on 31/10/25.
//

import SwiftUI

struct CategoryTabs: View {
    @Binding var selectedTab: String

    private let tabs = ["Explorar", "Música", "Listas"]

    var body: some View {
        HStack(spacing: 15) {
            ForEach(tabs, id: \.self) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    Text(tab)
                        .foregroundStyle(selectedTab == tab ? .white : .white.opacity(0.6))
                        .frame(width: 75)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.roundedRectangle)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
        CategoryTabs(selectedTab: .constant("Música"))
    }
}
