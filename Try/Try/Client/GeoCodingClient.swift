//
//  GeoCodingClient.swift
//  Try
//
//  Created by Nouman Pervez on 01/02/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

struct GeoCodingClient {
    
    func coordinateByCity(_ city: String) async throws -> Location? {
        let (data, response) = try await URLSession.shared.data(from: APIEndPoint.endPointURL(apiEndPoint: .latLonByLocation(city)))
        
        guard let response = response as? HTTPURLResponse,
            response.statusCode == 200 else {
            throw NetworkError.invalidResponse
        }
        
        let location = try JSONDecoder().decode([Location].self, from: data)
        return location.first
    }
}
