//
//  ContentView.swift
//  Ejercicio5SuperHeroes
//
//  Created by Diana Rammal Sansón on 3/11/25.
//

import SwiftUI

struct ContentView: View {
    let adaptativeItem: [GridItem] = [GridItem(.adaptive(minimum: 150))]
                                                          
    var body: some View {

        NavigationStack {
            ZStack {
                HeroGradientBackground()
                ScrollView {
                    LazyVGrid(columns: adaptativeItem) {
                        ForEach(SUPERHEROES) { superheroe in
                            NavigationLink(value: superheroe) {
                                SuperHeroeCard(superheroe: superheroe)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                .navigationTitle("Superhéroes 🦸🏻‍♀️")
                .navigationDestination(for: SuperHero.self) { superheroe in
                    SuperHeroeDetail(superheroe: superheroe)
                }
                .safeAreaPadding()
            }
        }
    }
}

#Preview {
    ContentView()
}
