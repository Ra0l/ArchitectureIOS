//
//  ListOfMoviesPresenter.swift
//  ArchitectureIOS
//
//  Created by Raul Kevin Aliaga Shapiama on 3/5/24.
//

import Foundation

protocol ListOfMoviesPresentable: AnyObject {
    var ui: ListOfMoviesUI? { get }
    var viewModels: [ViewModel] { get }
    func onViewAppear()
}

protocol ListOfMoviesUI: AnyObject {
    func update(movies: [ViewModel])
}

class ListOfMoviesPresenter: ListOfMoviesPresentable {
    
    weak var ui: ListOfMoviesUI?
    
    private let listOfMoviesInteractor: ListOfMoviesInteractable
    var viewModels: [ViewModel] = []
    private let mapper: Mapper
    
    init(listOfMoviesInteractor: ListOfMoviesInteractable, mapper: Mapper = Mapper()) {
        self.mapper = mapper
        self.listOfMoviesInteractor = listOfMoviesInteractor
    }
    
    func onViewAppear() {
        Task {
            let models = await listOfMoviesInteractor.getListOfMovies().results
            viewModels = models.map(mapper.map(entity:))
            ui?.update(movies: viewModels)
        }
    }
}
