//
//  ApexPredator.swift
//  luyenlai3
//
//  Created by TuanAnh on 14/3/25.
//

import MapKit
import SwiftUI

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScence]
    let link: String
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScence: Decodable, Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    var location:CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}

enum APType: String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case air
    case sea
    
    var id: APType {
        self
    }
    
    var background: Color {
        switch self {
            case .land:
                .brown
            case .air:
                .teal
            case .sea:
                .blue
            case .all:
                .black
        }
    }
    
    var icon: String {
        switch self {
            case .all:
                "square.stack.3d.up.fill"
            case .land:
                "leaf.fill"
            case .air:
                "wind"
            case .sea:
                "drop.fill"
        }
    }
}
