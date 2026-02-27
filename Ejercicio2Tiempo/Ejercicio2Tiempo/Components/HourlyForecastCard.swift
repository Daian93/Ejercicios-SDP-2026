//
//  HourlyForecastCard.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 2/11/25.
//

import SwiftUI

struct HourlyForecastCard: View {
    let temperatures: [Temperature]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(temperatures) { temperature in
                    HourlyTemperatureItem(temperature: temperature)
                }
            }
            .padding(.horizontal, 10)
        }
        .cardStyle()
    }
}

#Preview {
    ZStack {
        DynamicBackground()
        HourlyForecastCard(temperatures: temperatures)
    }
}
