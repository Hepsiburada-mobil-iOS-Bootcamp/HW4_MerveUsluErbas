
////
////  ViewCell.swift
////  HW4_Merve_RickandMorty
////
////  Created by Cokomel on 12.10.2021.
////
//

import UIKit
import Kingfisher
class ViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.layer.cornerRadius = 20
       // let colorContainer = UIColor(hexString: "#0575E6")
        temp.backgroundColor = .gray
        return temp
    }()
    
    private lazy var detailStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [speciesLabel, statusLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 20
        return temp
    }()
    
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [characterImageView, nameLabel,detailStackView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.centerXAnchor.constraint(equalTo: characterImageView.centerXAnchor).isActive = true
        detailStackView.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor).isActive = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 10
        return temp
    }()
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.contentMode = .center
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var  speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.contentMode = .center
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var  statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.contentMode = .center
        label.textAlignment = .center
        
        return label
    }()
    private lazy var characterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "kedi")!
        imageView.makeRounded()
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
        containerView.addSubview(mainStackView)
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            
            //
        ])
        
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData ( with data: CharacterResults){
        
        nameLabel.text = data.name
        statusLabel.text = data.status
        speciesLabel.text = data.species
        let urlCharacter = URL(string: data.image)
        self.characterImageView.kf.setImage(with: urlCharacter)
        
        
    }
    
}




