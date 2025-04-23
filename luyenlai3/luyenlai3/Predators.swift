//
//  Predators.swift
//  luyenlai3
//
//  Created by TuanAnh on 14/3/25.
//

import Foundation



class Predators {
    var allapexPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []

    init() {
        decodeAppPredators()
    }

    func decodeAppPredators() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
                allapexPredators = apexPredators
            } catch {
                print("Error decode Json data: \(error)")
            }
        }
    }

    func searchItem(for searchItem: String) -> [ApexPredator] {
        if searchItem.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter { predator in
                predator.name.localizedStandardContains(searchItem)
            }
        }
    }

    func sort(by alphebetical: Bool) {
        apexPredators.sort { predator1, predator2 in
            if alphebetical {
                predator1.name<predator2.name
            } else {
                predator1.id<predator2.id
            }
        }
    }

    func filter(by type: APType) {
        if type == .all {
            apexPredators = allapexPredators
            
        }
        else {
            apexPredators = allapexPredators.filter { predator in
                predator.type == type
            }
        }
    }
}
