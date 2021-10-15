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
    // let prev: JSONNull?
}

struct CharacterResults : Codable {
    let id:Int
    let name:String
    let status:String
    let species:String
    //   let species: Species
    //let status:Status
    let image:String
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
