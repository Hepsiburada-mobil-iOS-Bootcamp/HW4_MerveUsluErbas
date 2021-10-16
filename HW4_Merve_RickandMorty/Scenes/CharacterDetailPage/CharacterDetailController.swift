//
//  CharacterDetailController.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 15.10.2021.
//

import Foundation
import UIKit
import Kingfisher

class CharacterDetailController: UIViewController,SingleCharacterManagerDelegate,UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var imageView: UIImageView!

 
    
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.estimatedRowHeight = UITableView.automaticDimension
        temp.register(UITableViewCell.self, forCellReuseIdentifier: "CharacterDetailCell")
        return temp
    }()
    

    
    var currentCharacterData=[CharacterDatas]()
    var singleCharacterManager=SingleCharacterManager()
    var characterId:Int = 0
    var selectedCharacter : CharacterResults!
    
    
    func pullSingleCharacter(character: SingleCharacterModel) {
        currentCharacterData=character.tableRepresentation
        DispatchQueue.main.async {
            self.tableView.reloadData()
            let urlCharacter = URL(string: character.image)

        }
    }
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
        
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        tableView.dataSource = self
        singleCharacterManager.delegate=self
        let url="https://rickandmortyapi.com/api/character/\(characterId)"
        singleCharacterManager.fetchCharacter(with: url)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        
     

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentCharacterData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDetailCell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CharacterDetailCell")
        
     
          let row = indexPath.row
      
        cell.textLabel!.text = currentCharacterData[row].title
        cell.detailTextLabel!.text = currentCharacterData[row].value

        
        return cell
      }
    
}
