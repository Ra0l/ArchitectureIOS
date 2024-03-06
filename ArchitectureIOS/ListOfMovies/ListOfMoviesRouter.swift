//
//  ListOfMoviesRouter.swift
//  ArchitectureIOS
//
//  Created by Raul Kevin Aliaga Shapiama on 3/5/24.
//

import Foundation
import UIKit

class ListOfMoviesRouter {
    func showListOfMovies(window: UIWindow?) {
        let interactor = ListOfMoviesInteractor()
        let presenter = ListOfMoviesPresenter(listOfMoviesInteractor: interactor)
        
        let view = ListOfMoviesView(presenter: presenter)
//        view.presenter = presenter
        
        presenter.ui = view
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
