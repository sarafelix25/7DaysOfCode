//
//  Model.swift
//  MovieList
//
//  Created by Sara Batista dos Santos Felix on 1/29/23.
//

import UIKit

struct MovieResults: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String
    let release_date: String
    let poster_path: String
    let overview: String
    let vote_average: Double

    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case release_date
        case poster_path
        case overview
        case vote_average
    }
}
