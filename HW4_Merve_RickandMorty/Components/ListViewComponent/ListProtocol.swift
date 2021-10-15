//
//  ListViewProtocol.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 12.10.2021.
//

import Foundation

protocol ListProtocol: AnyObject {
    
  //  func askNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getData(at index: Int) -> GenericDataProtocol?
    
}
