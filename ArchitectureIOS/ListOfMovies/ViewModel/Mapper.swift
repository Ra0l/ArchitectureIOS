//
//  Mapper.swift
//  ArchitectureIOS
//
//  Created by Raúl Kevín Aliaga Shapiama on 6/03/24.
//

import Foundation

struct Mapper {
    func map(entity: PopularMovieEntity) -> ViewModel {
        ViewModel(title: entity.title, overview: entity.overview, imageURL: URL(string: "https://image.tmdb.org/t/p/w200" + entity.imageURL))
    }
}
