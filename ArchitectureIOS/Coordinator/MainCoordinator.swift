//
//  MainCoordinator.swift
//  ArchitectureIOS
//
//  Created by Raul Kevin Aliaga Shapiama on 3/5/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listOfCharacterViewController = storyboard.instantiateViewController(withIdentifier: "CharacterListViewController")
        navigationController?.pushViewController(listOfCharacterViewController, animated: true)
    }
}
