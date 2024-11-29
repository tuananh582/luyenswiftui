//
//  FetchService.swift
//  buoi3
//
//  Created by TuanAnh on 25/11/24.
//

import Foundation

struct FetchService {
    private enum FetchError: Error {
        case badResponse
    }

    private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
    
    // https://breaking-bad-api-six.vercel.app/api/quotes/random?production=Breaking+bad
    func fetchQuote(from show: String) async throws -> Quote {
        // Build fetch Url
        let quoteURL = baseURL.appending(path: "quotes/random")
        let fetchUrl = quoteURL.appending(queryItems: [URLQueryItem(name: "production", value: show)])
        
        // Fetch data
        let (data, response) = try await URLSession.shared.data(from: fetchUrl)
        // Handle response // 200 meaning everything is good
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        // Decode data
        let quote = try JSONDecoder().decode(Quote.self, from: data)
        
        // return quoto
        return quote
    }

    func fetchCharacter(_ name: String) async throws -> Character {
        // Build fetch URL
        let characterURL = baseURL.appending(path: "characters")
        let fetchUrl = characterURL.appending(queryItems: [URLQueryItem(name: "name", value: name)])
        // Fetch data
        let (data, response) = try await URLSession.shared.data(from: fetchUrl)
        // Handle response // 200 meaning everything is good
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let characters = try decoder.decode([Character].self, from: data)
        
        return characters[0]
    }

    func fetchDeadth(for character: String) async throws -> Death? {
        let fetchURL = baseURL.appending(path: "deaths")
        let (data, response) = try await URLSession.shared.data(from: fetchURL)
        // Handle response // 200 meaning everything is good
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let deaths = try decoder.decode([Death].self, from: data)
        for death in deaths {
            if death.character == character {
                return death
            }
        }
        return nil
    }
    func fetchEpisode(from show: String) async throws -> Episode {
        // Build fetch URL
        let episodeURL = baseURL.appending(path: "episodes")
        let fetchUrl = episodeURL.appending(queryItems: [URLQueryItem(name: "production", value: show)])
        // Fetch data
        let (data, response) = try await URLSession.shared.data(from: fetchUrl)
        // Handle response // 200 meaning everything is good
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw FetchError.badResponse
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let episodes = try decoder.decode([Episode].self, from: data)
        
        return episodes.randomElement()!
    }
}
