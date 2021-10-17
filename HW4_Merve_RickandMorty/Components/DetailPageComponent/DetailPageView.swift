//
//  DetailPageView.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 16.10.2021.
//

import UIKit
import Kingfisher

class DetailPageView:BaseView  {
    
    deinit {
        print("DEINIT DetailPageView")
    }
    
    weak var delegateCharacterDetail: DetailPageProtocol?
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        return temp
    }()
    
    
    
    private lazy var tableView: UITableView = {
        let temp = UITableView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.estimatedRowHeight = UITableView.automaticDimension
        temp.register(UITableViewCell.self, forCellReuseIdentifier: "CharacterDetailCell")
        temp.backgroundColor = .black
        return temp
    }()
    
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.makeRounded()
        return imageView
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [characterImageView, tableView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        return temp
    }()
    
    
    override func addComponents() {
        super.addComponents()
        addTableView()
    }
    //
    private func addTableView() {
        
        addSubview(containerView)
        containerView.addSubview(characterImageView)
        containerView.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            characterImageView.topAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.topAnchor, constant: 10),
            characterImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            characterImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            characterImageView.bottomAnchor.constraint(equalTo: tableView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
        ])
    }
    
    private func setupImage() {
        
        let urlImage = delegateCharacterDetail?.getImageURL()
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.characterImageView.kf.setImage(with: urlImage)
        }
    }
    
    
    
    
}

extension DetailPageView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        setupImage()
        return delegateCharacterDetail?.getCountOfItem(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let data = delegateCharacterDetail?.getDataOfCharacter(at: indexPath.row) else { fatalError("Please provide data") }
        var cell = tableView.dequeueReusableCell(withIdentifier: "CharacterDetailCell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CharacterDetailCell")
        
        cell.textLabel!.font = .boldSystemFont(ofSize: 15)
        cell.textLabel!.text = data.title
        cell.detailTextLabel!.text = data.value
        return cell
    }
    
}

extension UIImageView {
    
    func makeRounded() {
        
        self.layer.borderWidth = 2
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
    }
}


