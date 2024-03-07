//
//  MapperDetailViewModel.swift
//  ArchitectureIOS
//
//  Created by Raúl Kevín Aliaga Shapiama on 6/03/24.
//

import Foundation

struct MapperDetailViewModel {
    func map(entity: DetailMovieEntity) -> DetailMovieViewModel {
        DetailMovieViewModel(title: entity.title,
                             overview: entity.overview,
                             backdroupPath: URL(string: "https://image.tmdb.org/t/p/w200" + entity.backdropPath))
    }
}
