//
//  CharacterListView.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 11.10.2021.
//

import UIKit

class CharacterListView:BaseView  {
    
    deinit {
        print("DEINIT ItemListView")
    }
    
    weak var delegateListProtocol: ListProtocol?
    
//    private lazy var tableView: UITableView = {
//        let temp = UITableView()
//        temp.translatesAutoresizingMaskIntoConstraints = false
//        temp.delegate = self
//        temp.dataSource = self
//        temp.estimatedRowHeight = UITableView.automaticDimension
//        temp.register(ItemTableViewCell.self, forCellReuseIdentifier: ItemTableViewCell.identifier)
//        return temp
//    }()
    
    func reloadCollectionView() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    lazy var flowLayout:UICollectionViewFlowLayout = {

            let f = UICollectionViewFlowLayout()
            f.scrollDirection = .vertical
    
         //   f.itemSize = CGSize(width: 100/2, height: 100)
            f.minimumInteritemSpacing = 20
        //CGFloat.greatestFiniteMagnitude
            f.minimumLineSpacing = 20
            return f
        }()
  
    
    private lazy var collectionView: UICollectionView = {
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.flowLayout)

        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self

       // view.setCollectionViewLayout(self.flowLayout, animated: true)
       // view.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        view.register(ViewCell.self, forCellWithReuseIdentifier: ViewCell.identifier)
        view.backgroundColor = .red
        return view
    }()
  
    
    
//    lazy var collectionView: UICollectionView = {
//        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 60, height: 60)
//
//        let myCollectionView:UICollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
//        myCollectionView.dataSource = self
//        myCollectionView.delegate = self
//        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
//        myCollectionView.backgroundColor = UIColor.white
//        return myCollectionView
//    }()
//
//

    
    
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

 
    
}

extension CharacterListView: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return delegateListProtocol?.getNumberOfItem(in: section) ?? 1
        print(delegateListProtocol?.getNumberOfItem(in: section))
      //  return 10
    }
    


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let data = delegateListProtocol?.getData(at: indexPath.row) else { fatalError("Please provide data") }

        guard let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: ViewCell.identifier, for: indexPath) as? ViewCell) else {return UICollectionViewCell()}

        cell.setData(by: data)
      //  cell.backgroundColor = .blue
        
        
//        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
//        myCell.backgroundColor = UIColor.blue
//        return myCell
        
        return cell
    }




}

//extension CharacterListView:UICollectionViewDataSource, UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 100
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
//        myCell.backgroundColor = UIColor.red
//        return myCell
//    }
    
    
//}










//extension ItemListView: UITableViewDelegate, UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return pikacu?.askNumberOfSection() ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return pikacu?.askNumberOfItem(in: section) ?? 0
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        guard let data = pikacu?.askData(at: indexPath.row) else { fatalError("Please provide data") }
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemTableViewCell.identifier, for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
//
//        cell.setData(by: data)
//
//        return cell
//    }
//}
