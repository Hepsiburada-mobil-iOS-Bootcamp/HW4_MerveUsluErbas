//
//  CharacterListView.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 11.10.2021.
//

import Foundation
import UIKit
import SwiftUI

class CharacterListView:BaseView  {
    
    deinit {
        print("DEINIT CharacterListView")
    }
    
    weak var delegateListProtocol: ListProtocol?
    var characterDetailDelegate : CharacterDetailProtocol?
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    lazy var flowLayout:UICollectionViewFlowLayout = {
        
        let f = UICollectionViewFlowLayout()
        f.scrollDirection = .vertical
        
        //   f.itemSize = CGSize(width: 100/2, height: 100)
        // f.minimumInteritemSpacing = 2.0
        //CGFloat.greatestFiniteMagnitude
        //f.minimumLineSpacing = 2.0
        
        //f.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
        f.minimumInteritemSpacing = 5.0
        f.minimumLineSpacing = 10.0
        
        return f
    }()
    
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.flowLayout)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        
        view.register(ViewCell.self, forCellWithReuseIdentifier: ViewCell.identifier)
        //let color = UIColor(hexString: "#44A08D")
        view.backgroundColor = .black
        
        return view
    }()
    
    
    
    
    override func addComponents() {
        super.addComponents()
        addCollectionView()
    }
    //    
    private func addCollectionView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        let tableViewContentSize = collectionView.contentSize.height
        let scrollViewSize = scrollView.frame.size.height
        
        if tableViewContentSize != 0 {
            if position > (tableViewContentSize-scrollViewSize){
                print("fetching, Pagination is enabled.")
                delegateListProtocol?.getNewCharacter()
                
            }
        }
    }
    
    
    
}

extension CharacterListView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 2) - 15), height: CGFloat(200))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegateListProtocol?.getNumberOfItem(in: section) ?? 0
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let data = delegateListProtocol?.getData(at: indexPath.row) else { fatalError("Please provide data") }
        
        //
        guard let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: ViewCell.identifier, for: indexPath) as? ViewCell) else {return UICollectionViewCell()}
        
        cell.setData(with: data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        characterDetailDelegate?.openCharacterDetail(with: indexPath.row)
      
    }
    
    
}


//extension UIColor {
//    convenience init(hexString: String, alpha: CGFloat = 1.0) {
//        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
//        let scanner = Scanner(string: hexString)
//        if (hexString.hasPrefix("#")) {
//            scanner.scanLocation = 1
//        }
//        var color: UInt32 = 0
//        scanner.scanHexInt32(&color)
//        let mask = 0x000000FF
//        let r = Int(color >> 16) & mask
//        let g = Int(color >> 8) & mask
//        let b = Int(color) & mask
//        let red   = CGFloat(r) / 255.0
//        let green = CGFloat(g) / 255.0
//        let blue  = CGFloat(b) / 255.0
//        self.init(red:red, green:green, blue:blue, alpha:alpha)
//    }
//    func toHexString() -> String {
//        var r:CGFloat = 0
//        var g:CGFloat = 0
//        var b:CGFloat = 0
//        var a:CGFloat = 0
//        getRed(&r, green: &g, blue: &b, alpha: &a)
//        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
//        return String(format:"#%06x", rgb)
//    }
//}
