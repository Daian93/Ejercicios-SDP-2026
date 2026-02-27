//
//  WeatherHeaderView.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 2/11/25.
//

import SwiftUI

struct WeatherHeaderView: View {
    @Binding var selection: Int
    let options: [String]

    var body: some View {
        VStack(spacing: 20) {
            Text("Tiempo")
                .font(.title2)
                .foregroundStyle(.white)
                .bold()
                .padding(.top)

            Text("Madrid")
                .font(.system(size: 50))
                .bold()
        }

        Picker("", selection: $selection) {
            ForEach(0..<options.count, id: \.self) { index in
                Text(options[index])
            }
        }
        .pickerStyle(.segmented)
        .clipShape(Capsule())
        .frame(width: 180)
        .padding(.top, 4)
    }
}

#Preview {
    @Previewable @State var selection = 0
    let options = ["Hoy", "24h", "10 días"]
    ZStack {
        DynamicBackground()
        VStack {
            WeatherHeaderView(selection: $selection, options: options)
        }
    }
}
