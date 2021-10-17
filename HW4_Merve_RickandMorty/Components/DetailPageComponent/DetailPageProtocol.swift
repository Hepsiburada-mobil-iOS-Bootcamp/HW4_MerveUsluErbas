//
//  DetailPageProtocol.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 16.10.2021.
//

import Foundation

protocol DetailPageProtocol: AnyObject {

    func getCountOfItem(in section: Int) -> Int
    func getDataOfCharacter(at index: Int) -> CharacterDatas?
    func getImageURL() -> URL?
}
