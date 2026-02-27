//
//  Temperatures.swift
//  Ejercicio2Tiempo
//
//  Created by Diana Rammal Sansón on 2/11/25.
//

import Foundation

struct Temperature: Identifiable {
    let id = UUID()
    let hour: String
    let symbol: String
    let temp: String
}

let temperatures: [Temperature] = [
    Temperature(hour: "0", symbol: "moon.stars.fill", temp: "10º"),
    Temperature(hour: "1", symbol: "cloud.moon.fill", temp: "10º"),
    Temperature(hour: "2", symbol: "cloud.fill", temp: "9º"),
    Temperature(hour: "3", symbol: "cloud.fill", temp: "9º"),
    Temperature(hour: "4", symbol: "cloud.fill", temp: "8º"),
    Temperature(hour: "5", symbol: "cloud.moon.fill", temp: "8º"),
    Temperature(hour: "6", symbol: "cloud.moon.fill", temp: "7º"),
    Temperature(hour: "7", symbol: "moon.stars.fill", temp: "7º"),
    Temperature(hour: "8", symbol: "sun.horizon.fill", temp: "6º"),
    Temperature(hour: "9", symbol: "sun.max.fill", temp: "8º"),
    Temperature(hour: "10", symbol: "sun.max.fill", temp: "10º"),
    Temperature(hour: "11", symbol: "sun.max.fill", temp: "13º"),
    Temperature(hour: "12", symbol: "sun.max.fill", temp: "15º"),
    Temperature(hour: "13", symbol: "sun.max.fill", temp: "17º"),
    Temperature(hour: "14", symbol: "sun.max.fill", temp: "18º"),
    Temperature(hour: "15", symbol: "sun.max.fill", temp: "19º"),
    Temperature(hour: "16", symbol: "sun.max.fill", temp: "19º"),
    Temperature(hour: "17", symbol: "sun.max.fill", temp: "18º"),
    Temperature(hour: "18", symbol: "sun.max.fill", temp: "17º"),
    Temperature(hour: "19", symbol: "moon.stars.fill", temp: "15º"),
    Temperature(hour: "20", symbol: "moon.stars.fill", temp: "13º"),
    Temperature(hour: "21", symbol: "cloud.moon.rain.fill", temp: "12º"),
    Temperature(hour: "22", symbol: "cloud.moon.rain.fill", temp: "12º"),
    Temperature(hour: "23", symbol: "cloud.moon.fill", temp: "11º"),
    Temperature(hour: "24", symbol: "moon.stars.fill", temp: "10º")
]
