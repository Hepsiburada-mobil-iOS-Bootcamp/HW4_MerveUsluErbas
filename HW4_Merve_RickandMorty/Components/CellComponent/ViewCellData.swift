//
//  ViewCellData.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 14.10.2021.
//

import Foundation


class ViewCellData: GenericDataProtocol {
    
  //  private(set) var imageData: CustomImageViewComponentData
    private(set) var cellInfo: LabelPackComponentData
 
     init(cellInfo: LabelPackComponentData) {
         self.cellInfo = cellInfo
     }
    
    
    
    
    
  //  private(set) var name: String
    
//    init(name:String){
//        self.name = name
//    }
//    private(set) var imageData: CustomImageViewComponentData
//    private(set) var cellInfo: LabelPackComponentData
//    
//    init(imageData: CustomImageViewComponentData,
//         cellInfo: LabelPackComponentData) {
//        self.imageData = imageData
//        self.cellInfo = cellInfo
//    }
//    
}
