//
//  DetailPresenter.swift
//  ArchitectureIOS
//
//  Created by Raúl Kevín Aliaga Shapiama on 6/03/24.
//

import Foundation

protocol DetailPresenterUI: AnyObject {
    func updateUi(viewModel: DetailMovieViewModel)
}

protocol DetailPresentable: AnyObject {
    var ui: DetailPresenterUI? { get }
    var movieId: String { get }
    func onViewAppear()
}

class DetailPresenter: DetailPresentable {
    
    weak var ui: DetailPresenterUI?
    let movieId: String
    private let interactor: DetailInteractable
    private let mapper: MapperDetailViewModel
    
    init(movieId: String, interactor: DetailInteractable, mapper: MapperDetailViewModel) {
        self.movieId = movieId
        self.interactor = interactor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let model = await interactor.getDetailMovie(withId: movieId)
            let viewModel = mapper.map(entity: model)
            await MainActor.run(body: {
                self.ui?.updateUi(viewModel: viewModel)
                print(viewModel)
            })
        }
    }
}
