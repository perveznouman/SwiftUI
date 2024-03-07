//
//  Weather.swift
//  Try
//
//  Created by Nouman Pervez on 01/02/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    let temp: Double
}
