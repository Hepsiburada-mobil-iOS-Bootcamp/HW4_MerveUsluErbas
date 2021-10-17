//
//  SingleCharacterData.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 15.10.2021.
//

import Foundation


struct SingleCharacterData : Decodable {
    
    let id:Int
    let name:String
    let status:String
    let species:String
    let image:String
    let gender:String
    let origin:Origin
    let location:Origin
    let episode:[String]
    
    
}

struct Origin: Decodable {
    let name:String
    let url:String
    
}
