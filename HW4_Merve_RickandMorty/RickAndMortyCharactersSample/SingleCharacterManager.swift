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
                 //   let dataString = String(data: safeData, encoding: .utf8)
             
                        
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
            let id=decodedData.id
            let name=decodedData.name
            let status=decodedData.status
            let species=decodedData.species
            let image=decodedData.image
            let gender=decodedData.gender
            let originName=decodedData.origin.name
            let originUrl=decodedData.origin.url
            let locationName=decodedData.location.name
            let locationUrl=decodedData.location.url
            let episode=decodedData.episode
            
            let character = SingleCharacterModel(id: id, name: name, status:status, species: species, image: image, gender: gender, originName: originName, originUrl: originUrl, locationName: locationName, locationUrl: locationUrl, episode: episode)
            
            return character
        } catch  {
            print(error)
            return nil
        }
    }
}
