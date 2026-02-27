//
//  HourlyTemperatureItem.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 2/11/25.
//

import SwiftUI

struct HourlyTemperatureItem: View {
    let temperature: Temperature

    var body: some View {
        VStack(spacing: 10) {
            Text(temperature.hour)
                .font(.subheadline)
                .bold()

            Image(systemName: temperature.symbol)
                .symbolRenderingMode(.multicolor)
                .font(.title2)

            Text(temperature.temp)
                .font(.subheadline)
                .bold()
        }
        .frame(width: 56, height: 100)
    }
}

#Preview {
    let sample = Temperature(hour: "14", symbol: "sun.max.fill", temp: "18º")
    ZStack {
        DynamicBackground()
        HourlyTemperatureItem(temperature: sample)
    }
}
