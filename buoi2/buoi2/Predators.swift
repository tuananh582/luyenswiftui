//
//  Predators.swift
//  buoi2
//
//  Created by TuanAnh on 6/11/24.
//

import Foundation

class Predators {
    var allapexPredators: [ApexPredator] = []
    var apexPredators: [ApexPredator] = []
    init() {
        decodeApexPredatorData()
    }

    func decodeApexPredatorData() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allapexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allapexPredators
            } catch {
                print("Error decoding JSON data : \(error)")
            }
        }
    }

    func search(for searchTerm: String) -> [ApexPredator] {
        if searchTerm.isEmpty {
            return apexPredators
        } else {
            return apexPredators.filter { predator in
                predator.name.localizedCaseInsensitiveContains(searchTerm)
            }
        }
    }

    func sort(by alphabetical: Bool) {
        apexPredators.sort { predator1, predator2 in

            if alphabetical {
                predator1.name<predator2.name
            } else {
                predator1.id<predator2.id
            }
        }
    }

    func filter(by type: PredatorType) {
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
