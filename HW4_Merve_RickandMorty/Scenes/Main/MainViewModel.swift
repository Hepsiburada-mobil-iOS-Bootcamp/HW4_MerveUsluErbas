//
//  MainViewModel.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 11.10.2021.
//

import Foundation
import UIKit


class MainViewModel {
    
    private var characterManager = CharacterManager()
    private var characterResult = [CharacterResults]()
    private var rickAndMortyURL = "https://rickandmortyapi.com/api/character"
    private var state: CharacterListStateBlock?
   
    
    
    func getCharacterList() {
        
        characterManager.delegate = self
        characterManager.fetchCharacter(with: rickAndMortyURL)
    }
    
    func subscribeState(completion: @escaping CharacterListStateBlock) {
        state = completion
    }
    
}

extension MainViewModel : CharacterManagerDelegate {
    
    func pullCharacter(character: CharacterData) {
        
        characterResult.append(contentsOf:character.results)
        if character.info.next != nil {
            rickAndMortyURL = character.info.next!
        }
        state?(.done)
        
    }
}

extension MainViewModel : ListProtocol {
    
  
    
    func getNumberOfItem(in section: Int) -> Int {
        return characterResult.count
    }
    
    func getData(at index: Int) -> CharacterResults? {
        return characterResult[index]
    }
    
    func getNewCharacter () {
        getCharacterList()
    }
    

    
    
}


