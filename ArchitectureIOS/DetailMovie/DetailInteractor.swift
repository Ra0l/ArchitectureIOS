//
//  DetailInteractor.swift
//  ArchitectureIOS
//
//  Created by Raúl Kevín Aliaga Shapiama on 6/03/24.
//

import Foundation

/*
 https://api.themoviedb.org/3/movie/{movie_id}

 */

protocol DetailInteractable: AnyObject {
    func getDetailMovie(withId id: String) async -> DetailMovieEntity
}

class DetailInteractor: DetailInteractable {
    func getDetailMovie(withId id: String) async -> DetailMovieEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=a381377045f01e9e491feea2aee4d6de")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! JSONDecoder().decode(DetailMovieEntity.self, from: data)
    }
}
