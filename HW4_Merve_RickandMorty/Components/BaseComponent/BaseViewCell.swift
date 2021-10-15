//
//  BaseViewCell.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 12.10.2021.
//

import UIKit

class BaseViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    
    convenience init(reuseIdentifier: String?) {
        self.init(reuseIdentifier: reuseIdentifier)
        addMajorViews()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorViews()
        setupView()
    }
    
    func setupView() {}
    func addMajorViews() {}
    
    static var identifier: String {
        return String(describing: self)
    }
    
}
