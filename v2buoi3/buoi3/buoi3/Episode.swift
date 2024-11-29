//
//  Episode.swift
//  buoi3
//
//  Created by TuanAnh on 29/11/24.
//

import Foundation

struct Episode: Decodable {
    let episode: Int // 101
    let title: String
    let image: URL
    let synopsis: String
    let writtenBy: String
    let directedBy: String
    let airDate: String

    var seasonEpisode: String { //"Season 1 Episode 1"
        var episodeString = String(episode) // "101"
        let season = episodeString.removeFirst() // "epiString: 01 because we removed first , season = 1"

        if episodeString.first! == "0" {
            episodeString = String(episodeString.removeLast())
        }
        return "Season \(season) Episode \(episodeString)"
    }
}
