//
//  APIClient.swift
//  ArchitectureIOS
//
//  Created by Raul Kevin Aliaga Shapiama on 3/5/24.
//

import Foundation


final class ListOfCharacteresAPIClient {
    func getListOfCharacteres() async -> CharacterModelResponse {
        
        let url = URL(string: "https://rickandmortyapi.com/api/character")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(CharacterModelResponse.self, from: data)
    }
}
