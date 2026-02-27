//
//  DailyForecastCard.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 2/11/25.
//

import SwiftUI

struct DailyForecastCard: View {
    let days: [Days]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(days) { dayForecast in
                ForecastRow(forecast: dayForecast)
                if dayForecast.id != days.last?.id {
                    Divider()
                        .padding(.horizontal, 20)
                }
            }
        }
        .cardStyle()
        .padding(.bottom, 16)
    }
}

#Preview {
    ZStack {
        DynamicBackground()
        DailyForecastCard(days: days)
    }
}
