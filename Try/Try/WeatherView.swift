//
//  WeatherView.swift
//  Try
//
//  Created by Nouman Pervez on 01/02/24.
//

import SwiftUI

struct WeatherView: View {
    
    let geoCodingClient = GeoCodingClient()
    let weatherClient = WeatherClient()
    
    @State private var city: String = ""
    @State private var isFetching:Bool = false
    @State private var weather: Weather?
    
    var body: some View {
        VStack {
            TextField("City", text: $city)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    isFetching = true
                }
                .task(id: isFetching) {
                    if isFetching {
                        await fetchFromAPI()
                        isFetching = false
                        city = ""
                    }
                }
            Spacer()
            if let weather {
                Text(MeasurementFormatter.temperature(value: weather.temp))
                    .font(.system(size: 100))
            }
            Spacer()
        }
        .padding()
    }
    
    private func fetchFromAPI() async {
        do {
            guard let location = try await geoCodingClient.coordinateByCity(city) else { return }
            weather = try await weatherClient.fetchWeather(location: location)
        }
        catch {
            print("Failed to fetch data")
        }
    }
}

#Preview {
    WeatherView()
}
