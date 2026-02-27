//
//  ForecastRow.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 2/11/25.
//

import SwiftUI

struct ForecastRow: View {
    let forecast: Days
    
    var body: some View {
        HStack {
            Text(forecast.day)
                .font(.title3)
            
            Spacer()
            
            Image(systemName: forecast.symbol)
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 20))
                .frame(width: 35)
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 3)
                        .fill(.gray.opacity(0.3))
                        .frame(height: 6)
                    RoundedRectangle(cornerRadius: 3)
                        .fill(.blue)
                        .frame(width: geometry.size.width * CGFloat(forecast.tempScaleValue), height: 6)
                }
                .frame(maxHeight: .infinity)
            }
            .frame(maxWidth: 100)
            
            Text(forecast.temp)
                .font(.title3)
                .fontWeight(.medium)
                .frame(width: 35, alignment: .trailing)
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    let sample = Days(
        day: "Lunes",
        symbol: "cloud.sun.fill",
        temp: "21°",
        tempScaleValue: 0.6
    )
    return ForecastRow(forecast: sample)
}
