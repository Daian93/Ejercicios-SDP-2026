//
//  ContentView.swift
//  Ejercicio4Contactos
//
//  Created by Diana Rammal Sansón on 2/2/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = ContactsViewModel()

    var body: some View {
        ContactListView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
