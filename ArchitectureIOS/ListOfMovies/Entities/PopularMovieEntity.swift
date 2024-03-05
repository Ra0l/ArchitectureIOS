//
//  PopularMovieEntity.swift
//  ArchitectureIOS
//
//  Created by Raul Kevin Aliaga Shapiama on 3/5/24.
//

import Foundation

struct PopularMovieEntity: Decodable {
    var id: Int
    var title: String
    var overview: String
    var imageURL: String
    var votes: Double
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case imageURL = "poster_path"
        case votes
    }
}
