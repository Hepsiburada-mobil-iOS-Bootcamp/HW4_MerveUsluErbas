//
//  MainViewModel.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 11.10.2021.
//

import Foundation

class MainViewModel {
    
   private var characterManager = CharacterManager()
   private var characterResult = [CharacterResults]()
   private var rickAndMortyURL = "https://rickandmortyapi.com/api/character"
   private let formatter: DataFormatterProtocol
   private var state: CharacterListStateBlock?
    
    init(formatter: DataFormatterProtocol) {
        self.formatter = formatter
    }
    
    func getCharacterList() {
        
        characterManager.delegate = self
        characterManager.fetchCharacter(with: rickAndMortyURL)
       // characterManager
    }
   
    func subscribeState(completion: @escaping CharacterListStateBlock) {
        state = completion
    }
    
}

extension MainViewModel : CharacterManagerDelegate {
    
    func pullCharacter(character: CharacterData) {
     
        characterResult.append(contentsOf:character.results)
        print("bura mı \(characterResult)")
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
        //return formatter.getItem(from: characterResult[index])
        print("Get data içi \(characterResult[index])")
        return characterResult[index]
    }
    
    
    
}
