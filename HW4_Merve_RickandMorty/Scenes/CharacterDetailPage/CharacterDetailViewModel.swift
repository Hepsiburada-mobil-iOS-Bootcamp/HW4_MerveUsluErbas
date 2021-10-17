//
//  CharacterDetailViewModel.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 15.10.2021.
//

import Foundation
import UIKit


class CharacterDetailViewModel {

    var currentCharacterData=[CharacterDatas]()
    var singleCharacterManager=SingleCharacterManager()
    var characterId:Int = 0
    var selectedCharacter : CharacterResults!
    var urlCharacter:URL?
    init(characterId: Int) {
        self.characterId = characterId
    }
    
    func getCharacterDetailList() {
        
        singleCharacterManager.delegate = self
        let characterDetailURL = "https://rickandmortyapi.com/api/character/\(characterId+1)"
        singleCharacterManager.fetchCharacter(with: characterDetailURL)
    }
    
    }


extension CharacterDetailViewModel : SingleCharacterManagerDelegate {
   
    func pullSingleCharacter(character: SingleCharacterModel) {
       
        currentCharacterData = character.tableRepresentation

        urlCharacter = URL(string: character.image)
    }
    
}

extension CharacterDetailViewModel : DetailPageProtocol {
    
    func getImageURL() -> URL? {
        return urlCharacter
    }
    
 
    func getCountOfItem(in section: Int) -> Int {
        return currentCharacterData.count
        
    }
    
    func getDataOfCharacter(at index: Int) -> CharacterDatas? {
        return currentCharacterData[index]
    }
    
}
