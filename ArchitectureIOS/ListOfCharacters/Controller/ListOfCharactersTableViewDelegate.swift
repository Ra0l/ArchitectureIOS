//
//  ListOfCharactersTableViewDelegate.swift
//  ArchitectureIOS
//
//  Created by Raul Kevin Aliaga Shapiama on 3/5/24.
//

import Foundation
import UIKit

class ListOfCharactersTableViewDelegate: NSObject, UITableViewDelegate{
    
    var didTapOnCell: ((Int) -> Void)?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
