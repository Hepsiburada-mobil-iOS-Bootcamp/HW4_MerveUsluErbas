//
//  BaseView.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 11.10.2021.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addComponents()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addComponents()
        setupView()
    }
    
    func addComponents() {
        
    }
    func setupView() { }
    
}
