//
//  CharacterData.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 12.10.2021.
//

import Foundation

struct CharacterData : Codable {
    let info : Info
    let results : [CharacterResults]
    
}

struct Info : Codable {
    
    let count : Int?
    let pages : Int?
    let next : String?
    let prev : String?
}

struct CharacterResults : Codable {
    let id:Int
    let name:String
    let status:String
    let species:String
    let image:String
}

