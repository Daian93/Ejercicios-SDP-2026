//
//  ContentView.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 1/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    let options = ["Hoy", "24h", "10 días"]
    let temperatures: [Temperature]
    let days: [Days]

    var body: some View {
        ZStack {
            DynamicBackground()
            VStack(spacing: 16) {
                WeatherHeaderView(selection: $selection, options: options)

                CurrentWeatherCard(
                    temperature: "22°",
                    description: "Parcialmente nublado",
                    maxTemp: "28°",
                    minTemp: "17°",
                    symbol: "cloud.sun.fill"
                )

                HourlyForecastCard(temperatures: temperatures)

                DailyForecastCard(days: days)
            }
        }
    }
}

#Preview {
    ContentView(temperatures: temperatures, days: days)
}
