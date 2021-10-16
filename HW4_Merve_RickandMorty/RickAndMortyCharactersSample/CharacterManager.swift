//
//  CharacterManager.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 12.10.2021.
//

import Foundation

protocol CharacterManagerDelegate {
    func pullCharacter(character: CharacterData)
}

struct CharacterManager {
    var delegate:CharacterManagerDelegate?
    func fetchCharacter(with urlLink:String)  {
        
        if let url = URL(string: urlLink){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData=data {
                        if let character = self.parseJSON(characterData: safeData){
                            self.delegate?.pullCharacter(character: character)
                    }
                    
                }
                
            }
            task.resume()
            
        }
    }
    
    func parseJSON(characterData : Data) -> CharacterData? {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CharacterData.self, from: characterData)
            return decodedData
        } catch  {
            print(error)
            return nil
        }
    }

}
