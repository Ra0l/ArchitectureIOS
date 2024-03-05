//
//  CharacterslistViewController.swift
//  ArchitectureIOS
//
//  Created by Raul Kevin Aliaga Shapiama on 3/5/24.
//

import UIKit

class CharacterslistViewController: UIViewController {
    
    var mainView: CharactersListView { self.view as! CharactersListView }
    let apiClient = ListOfCharacteresAPIClient()
    private var tableViewDataSource: ListOfCharactersTableViewDataSource?
    private var tableViewDelegate: ListOfCharactersTableViewDelegate?
    
    override func loadView() {
        view = CharactersListView()
        tableViewDelegate = ListOfCharactersTableViewDelegate()
        mainView.charactersTableView.delegate = tableViewDelegate
        tableViewDataSource = ListOfCharactersTableViewDataSource(tableView: mainView.charactersTableView)
        mainView.charactersTableView.dataSource = tableViewDataSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewDelegate?.didTapOnCell = { [weak self] index in
            print("Index \(index)")
            
            // Present new view controller
            
            guard let dataSource = self?.tableViewDataSource else {
                return
            }
            
            let characterModel = dataSource.characters[index]
            let characterDetailViewController = CharacterDetailViewController(characterDetailModel: characterModel)
            self?.present(characterDetailViewController, animated: true)
        }
        
        Task {
            let characters = await apiClient.getListOfCharacteres()
            print("Charactere \(characters)")
            tableViewDataSource?.set(characters: characters.results)
        }
    }
        
}

