//
//  WeatherClient.swift
//  Try
//
//  Created by Nouman Pervez on 06/02/24.
//

import Foundation


struct WeatherClient {
    
    func fetchWeather(location: Location) async throws -> Weather {
        let (data, response) = try await URLSession.shared.data(from: APIEndPoint.endPointURL(apiEndPoint: .weatherByLatLon(location.lat, location.lon)))
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NetworkError.invalidResponse }
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        return weatherResponse.main
        
    }
}
