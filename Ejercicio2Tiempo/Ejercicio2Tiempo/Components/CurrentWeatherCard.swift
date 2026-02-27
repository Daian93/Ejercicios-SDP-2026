//
//  CurrentWeatherCard.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 2/11/25.
//

import SwiftUI

struct CurrentWeatherCard: View {
    let temperature: String
    let description: String
    let maxTemp: String
    let minTemp: String
    let symbol: String

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 10) {
                Text(temperature)
                    .font(.system(size: 80, weight: .semibold))
                Text(description)
                    .font(.system(size: 21, weight: .semibold))
                HStack(spacing: 8) {
                    Text("Máx \(maxTemp)")
                    Text("·")
                    Text("Min \(minTemp)")
                }
                .font(.system(size: 16))
                .foregroundColor(.primary.opacity(0.6))
            }
            Spacer()
            Image(systemName: symbol)
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 60))
                .padding(.top, 10)
        }
        .padding(16)
        .cardStyle()
    }
}

#Preview {
    ZStack {
        DynamicBackground()
        CurrentWeatherCard(
            temperature: "22°",
            description: "Parcialmente nublado",
            maxTemp: "28°",
            minTemp: "17°",
            symbol: "cloud.sun.fill"
        )
    }
}
