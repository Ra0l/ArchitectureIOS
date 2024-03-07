//
//  DetailRouter.swift
//  ArchitectureIOS
//
//  Created by Raúl Kevín Aliaga Shapiama on 6/03/24.
//

import Foundation
import UIKit

protocol DetailRouting: AnyObject {
    func showDetail(fromViewController: UIViewController, withMovieId movieId: String)
}

class DetailRouter: DetailRouting {
    func showDetail(fromViewController: UIViewController, withMovieId movieId: String) {
        let interactor = DetailInteractor()
        let presenter = DetailPresenter(movieId: movieId,
                                        interactor: interactor,
                                        mapper: MapperDetailViewModel())
        let view = DetailView(presenter: presenter)
        presenter.ui = view
        
        fromViewController.present(view, animated: true)
    }
}
