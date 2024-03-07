//
//  ListOfMoviesRouter.swift
//  ArchitectureIOS
//
//  Created by Raul Kevin Aliaga Shapiama on 3/5/24.
//

import Foundation
import UIKit

protocol ListOfMoviesRouting: AnyObject {
    var detailRouter: DetailRouting? { get }
    var listOfMovieView: ListOfMoviesView? { get }
    func showListOfMovies(window: UIWindow?)
    func showDetailMovie(withMovieId movieId: String)
}

class ListOfMoviesRouter: ListOfMoviesRouting {
    
    var detailRouter: DetailRouting?
    var listOfMovieView: ListOfMoviesView?
    
    func showListOfMovies(window: UIWindow?) {
        self.detailRouter = DetailRouter()
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor,
                                              router: self)
        
        listOfMovieView = ListOfMoviesView(presenter: presenter)
//        view.presenter = presenter
        
        presenter.ui = listOfMovieView
        window?.rootViewController = listOfMovieView
        window?.makeKeyAndVisible()
    }
    
    func showDetailMovie(withMovieId movieId: String) {
        guard let fromViewController = listOfMovieView else { return }
        detailRouter?.showDetail(fromViewController: fromViewController, withMovieId: movieId)
    }
}
