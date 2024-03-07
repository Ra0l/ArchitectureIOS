//
//  ListOfMoviesPresenter.swift
//  ArchitectureIOS
//
//  Created by Raul Kevin Aliaga Shapiama on 3/5/24.
//

import Foundation
import UIKit

protocol ListOfMoviesPresentable: AnyObject {
    var ui: ListOfMoviesUI? { get }
    var viewModels: [ViewModel] { get }
    func onViewAppear()
    func onTapCell(atIndex: Int)
}

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [ViewModel])
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {
    
    weak var ui: ListOfMoviesUI?
    
    private let listOfMoviesInteractor: ListOfMoviesInteractable
    var viewModels: [ViewModel] = []
    private var models: [PopularMovieEntity] = []
    private let mapper: Mapper
    private let router: ListOfMoviesRouting
    
    init(listOfMoviesInteractor: ListOfMoviesInteractable, mapper: Mapper = Mapper(), router: ListOfMoviesRouting) {
        self.mapper = mapper
        self.listOfMoviesInteractor = listOfMoviesInteractor
        self.router = router
    }
    
    func onViewAppear() {
        Task {
            models = await listOfMoviesInteractor.getListOfMovies().results
            viewModels = models.map(mapper.map(entity:))
            ui?.update(movies: viewModels)
        }
    }
    
    func onTapCell(atIndex: Int) {
        let movieId = models[atIndex].id
        router.showDetailMovie(withMovieId: String(movieId))
    }
}
