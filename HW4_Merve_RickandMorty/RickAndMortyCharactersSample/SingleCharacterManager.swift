//
//  SingleCharacterManager.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 15.10.2021.
//

import Foundation

protocol SingleCharacterManagerDelegate {
    func pullSingleCharacter(character: SingleCharacterModel)
}

struct SingleCharacterManager {
    
    var delegate:SingleCharacterManagerDelegate?
    
    func fetchCharacter(with urlLink:String)  {
        
        if let url = URL(string: urlLink){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData=data {
                    if let character = self.parseJSONSingle(characterData: safeData){
                        self.delegate?.pullSingleCharacter(character: character)
                    }
                }
                
            }
            task.resume()
            
        }
    }
    
    func parseJSONSingle(characterData : Data) -> SingleCharacterModel? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(SingleCharacterData.self, from: characterData)
            
            let character = SingleCharacterModel(id: decodedData.id, name: decodedData.name, status: decodedData.status, species: decodedData.species, image: decodedData.image, gender: decodedData.gender, originName: decodedData.origin.name, originUrl: decodedData.origin.url, locationName: decodedData.location.name, locationUrl: decodedData.location.url, episode: decodedData.episode)
            
            
            return character
        } catch  {
            print(error)
            return nil
        }
    }
}
