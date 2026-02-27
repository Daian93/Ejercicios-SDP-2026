//
//  Ejercicio2TiempoApp.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 1/11/25.
//

import SwiftUI

@main
struct Ejercicio2TiempoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(temperatures: temperatures, days: days)
        }
    }
}
