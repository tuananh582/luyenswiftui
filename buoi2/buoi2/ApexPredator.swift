//
//  ApexPredator.swift
//  buoi2
//
//  Created by TuanAnh on 6/11/24.
//

import Foundation
import SwiftUI
import MapKit
struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: PredatorType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }

    struct MovieScene: Decodable,Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
    
    var location:CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}

enum PredatorType: String, Decodable, CaseIterable, Identifiable {
    case land
    case air
    case sea
    case all

    var id: PredatorType {
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
