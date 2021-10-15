//
//  CharacterListView.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 11.10.2021.
//

import UIKit



//protocol CharacterDetailProtocol {
//
//    func openCharacterDetail(with index: Int)
//}

class CharacterListView:BaseView  {
    
    deinit {
        print("DEINIT ItemListView")
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
        
        //                f.itemSize = CGSize(width: screenWidth/3, height: screenWidth/3)
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
        view.backgroundColor = .white
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
                print("fetching")
                delegateListProtocol?.getNewCharacter()
                
            }
        }
    }
    
    
    
}

extension CharacterListView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((collectionView.frame.size.width / 2) - 20), height: CGFloat(200))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegateListProtocol?.getNumberOfItem(in: section) ?? 1
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let data = delegateListProtocol?.getData(at: indexPath.row) else { fatalError("Please provide data") }
        
        //
        guard let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: ViewCell.identifier, for: indexPath) as? ViewCell) else {return UICollectionViewCell()}
        
        cell.backgroundColor = UIColor.yellow
        cell.setData(with: data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        characterDetailDelegate?.openCharacterDetail(with: indexPath.row)
      
    }
    
    
}

