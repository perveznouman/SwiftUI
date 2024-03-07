//
//  APIClient.swift
//  Try
//
//  Created by Nouman Pervez on 01/02/24.
//

import Foundation

enum APIEndPoint {
    
    static let baseURL = "http://api.openweathermap.org/"
    
    case latLonByLocation(String)
    case weatherByLatLon(Double, Double)
    
    private var urlPath: String {
        switch self {
        case .latLonByLocation(let location):
            return "geo/1.0/direct?q=\(location)&appid=\(Constants.Keys.weatherAPIKey)"
        case .weatherByLatLon(let lat, let lon):
            return "data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(Constants.Keys.weatherAPIKey)"
        }
    }
    
    static func endPointURL(apiEndPoint: APIEndPoint) -> URL {
        let endPointPath = apiEndPoint.urlPath
        return URL(string: baseURL + endPointPath)!
    }
}
