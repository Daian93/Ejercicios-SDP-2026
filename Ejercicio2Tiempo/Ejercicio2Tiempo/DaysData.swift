//
//  DaysData.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 2/11/25.
//

import Foundation

struct Days: Identifiable {
    let id = UUID()
    let day: String
    let symbol: String
    let temp: String
    let tempScaleValue: Double
}

let days: [Days] = [
    Days(day: "Lunes", symbol: "cloud.fill", temp: "22º", tempScaleValue: 0.7),
    Days(day: "Martes", symbol: "sun.max.fill", temp: "24º", tempScaleValue: 0.8),
    Days(day: "Miércoles", symbol: "sun.max.fill", temp: "22º", tempScaleValue: 0.7),
    Days(day: "Jueves", symbol: "cloud.fill", temp: "22º", tempScaleValue: 0.7),
    Days(day: "Viernes", symbol: "cloud.rain.fill", temp: "19º", tempScaleValue: 0.6)
    //Days(day: "Sábado", symbol: "cloud.fill", temp: "20º"),
    //Days(day: "Domingo", symbol: "cloud.rain.fill", temp: "18º")
]
