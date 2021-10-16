//
//  SingleCharacterModel.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 15.10.2021.
//

import Foundation

struct SingleCharacterModel {
    
    let id:Int
    let name:String
    let status:String
    let species:String
    let image:String
    let gender:String
    let originName:String
    let originUrl:String
    let locationName:String
    let locationUrl:String
    let episode:[String]
    
    
}

extension SingleCharacterModel: CustomStringConvertible {
var description: String {
  return "name: \(name)" +
    " status: \(status)" +
    " gender: \(gender)" +
    " species: \(species)" +
    " originName: \(originName)" +
    " originUrl: \(originUrl)" +
    " locationName: \(locationName)" +
    " locationUrl: \(locationUrl)"
   
}
}

typealias CharacterDatas = (title: String, value: String)

extension SingleCharacterModel{
var tableRepresentation: [CharacterDatas] {
  return [
    ("Name", name),
    ("Status", status),
    ("Gender", gender),
    ("Species", species),
    ("Origin Name", originName),
    ("Origin Url", originUrl),
    ("Location Name", locationName),
    ("Location Url", locationUrl)
   
  ]
}
}
