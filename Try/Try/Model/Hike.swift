//
//  Hike.swift
//  Try
//
//  Created by Nouman Pervez on 09/01/24.
//

import Foundation

struct Hike: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let image: String
    let height: Double
}
