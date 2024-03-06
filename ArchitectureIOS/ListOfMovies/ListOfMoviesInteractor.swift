//
//  ListOfMoviesInteractor.swift
//  ArchitectureIOS
//
//  Created by Raul Kevin Aliaga Shapiama on 3/5/24.
//

import Foundation
/**
 https://api.themoviedb.org/3/movie/550?api_key=
 https://api.themoviedb.org/3/movie/popular
 api_key:  a381377045f01e9e491feea2aee4d6de
 */

protocol ListOfMoviesInteractable: AnyObject {
    func getListOfMovies() async -> PopularMovieResponseEntity
}

class ListOfMoviesInteractor: ListOfMoviesInteractable {
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=a381377045f01e9e491feea2aee4d6de")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
    
}


class ListOfMoviesInteractorMock: ListOfMoviesInteractable {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        PopularMovieResponseEntity(results: [.init(id: 0, title: "Raul Aliaga iOS Dev", overview: "Aprendiendo Swift", imageURL: "", votes: 10.0),
                                             .init(id: 1, title: "Raul Aliaga iOS Dev", overview: "Aprendiendo SwiftUI", imageURL: "", votes: 10.0),
                                             .init(id: 2, title: "Raul Aliaga iOS Dev", overview: "Aprendiendo Swift Xcode", imageURL: "", votes: 10.0),
                                             .init(id: 3, title: "Raul Aliaga iOS Dev", overview: "Aprendiendo Swift 5.6", imageURL: "", votes: 10.0),
                                             .init(id: 4, title: "Raul Aliaga iOS Dev", overview: "Aprendiendo Swift Patterns", imageURL: "", votes: 10.0),
                                             .init(id: 5, title: "Raul Aliaga iOS Dev", overview: "Aprendiendo Firebase", imageURL: "", votes: 10.0),
                                             .init(id: 6, title: "Raul Aliaga iOS Dev", overview: "Aprendiendo VIPER", imageURL: "", votes: 10.0)
        ])
    }
}
