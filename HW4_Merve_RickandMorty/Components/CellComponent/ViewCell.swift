import UIKit
////
////  ViewCell.swift
////  HW4_Merve_RickandMorty
////
////  Created by Cokomel on 12.10.2021.
////
//
//import UIKit
//
//class ViewCell: BaseViewCell {
//
////    private lazy var containerView: UIView = {
////        let temp = UIView()
////        temp.translatesAutoresizingMaskIntoConstraints = false
////        temp.clipsToBounds = true
////        temp.backgroundColor = .yellow
////        return temp
////    }()
//
////    private lazy var mainStackView: UIStackView = {
////        let temp = UIStackView()
////        temp.addArrangedSubview(cellInfo)
////        temp.translatesAutoresizingMaskIntoConstraints = false
////        temp.alignment = .center
////        temp.distribution = .fill
////        temp.axis = .horizontal
////        temp.spacing = 20
////        return temp
////    }()
//
////    private lazy var imageViewComponent: CustomImageViewComponentContainer = {
////        let temp = CustomImageViewComponentContainer()
////        temp.translatesAutoresizingMaskIntoConstraints = false
////        temp.heightAnchor.constraint(equalToConstant: 50).isActive = true
////        temp.widthAnchor.constraint(equalToConstant: 50).isActive = true
////        temp.layer.cornerRadius = 4
////        temp.layer.shadowColor = UIColor.black.cgColor
////        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
////        temp.layer.shadowRadius = 4
////        temp.layer.shadowOpacity = 0.6
////        return temp
////    }()
//
//    private lazy var cellInfo: LabelPackComponent = {
//        let temp = LabelPackComponent(data: getLabelPackComponentData())
//        temp.translatesAutoresizingMaskIntoConstraints = false
//        return temp
//    }()
//
//    lazy var labell: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textColor = .black
//        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        label.lineBreakMode = .byWordWrapping
//        label.numberOfLines = 0
//        label.contentMode = .center
//        label.textAlignment = .center
//
//        return label
//    }()
//    override func addMajorViews() {
//        super.addMajorViews()
//        addUserComponents()
//    }
//
//    private func addUserComponents() {
////        contentView.addSubview(containerView)
//        contentView.addSubview(labell)
//       // containerView.addSubview(mainStackView)
//     //   containerView.addSubview(cellInfo)
//
//        NSLayoutConstraint.activate([
//
////            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
////
////            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
////
////            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
////
////            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
////
//            labell.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//
//            labell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
//
//            labell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
//
//            labell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//
//        ])
//
//    }
//
////    func setData(by value: CharacterResults) {
////        guard let data = value as? ViewCellData else { return }
////       // imageViewComponent.setData(by: data.imageData)
////        cellInfo.setData(by: data.cellInfo)
////    }
//
//    func configure ( with data: CharacterResults){
//
//        labell.text = data.name
//        print("CONFİG İÇİNDEYİM")
//
//    }
//
//    private func getLabelPackComponentData() -> LabelPackComponentData {
//        return LabelPackComponentData()
//            .setSubTitleLabelDistributionData(by: LabelDistributionData().setContentMode(by: .left).setTextAlignment(by: .left).setNumberOfLines(by: 2).setLineBreakMode(by: .byTruncatingTail))
//            .setTitleLabelDistributionData(by: LabelDistributionData().setContentMode(by: .left).setTextAlignment(by: .left).setNumberOfLines(by: 1).setLineBreakMode(by: .byTruncatingTail))
//            .setSpacing(by: 5)
//            .setStackViewAlignment(by: .fill)
//
//    }
//
//}



class ViewCell: UICollectionViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
    
    private lazy var udemyStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8.0
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    
    
    
    
        private lazy var containerView: UIView = {
            let temp = UIView()
            temp.translatesAutoresizingMaskIntoConstraints = false
            temp.clipsToBounds = true
            temp.backgroundColor = .yellow
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
        let temp = UIStackView(arrangedSubviews: [nameLabel, detailStackView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var pictureStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [ characterImageView,nameLabel, detailStackView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
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
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(containerView)
        containerView.addSubview(pictureStackView)
        NSLayoutConstraint.activate([
            
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),

            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),

            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            pictureStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),

            pictureStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),

            pictureStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),

            pictureStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            
//            characterImageView.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 5),
//            characterImageView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 5),
//            characterImageView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -5),
//            characterImageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -5),
            
            
            //nameLabel.bottomAnchor.constraint(equalTo: detailStackView.topAnchor, constant: -5),
            //nameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 5),
//           nameLabel.topAnchor.constraint(equalTo: mainStackView.topAnchor, constant: 5),
//            nameLabel.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 5),
//            nameLabel.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -5),
//            nameLabel.bottomAnchor.constraint(equalTo: detailStackView.topAnchor, constant: -5),
//
//            detailStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
//            detailStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant: 5),
//            detailStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant: -5),
//            detailStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: -5),
        ])
        
//        layer.shadowColor = UIColor.lightGray.cgColor
//        layer.shadowOffset = CGSize(width: 0, height: 2.0)
//        layer.shadowRadius = 5.0
//        layer.shadowOpacity = 1.0
//        layer.masksToBounds = false
//        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: contentView.layer.cornerRadius).cgPath
//        layer.backgroundColor = UIColor.clear.cgColor
//
//        contentView.layer.masksToBounds = true
//        layer.cornerRadius = 10
        
     
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure ( with data: CharacterResults){
  
          nameLabel.text = "deneme"
        statusLabel.text = "detail"
        speciesLabel.text = "detail"
          print("CONFİG İÇİNDEYİM")
  
      }
//    private lazy var containerView: UIView = {
//        let temp = UIView()
//        temp.translatesAutoresizingMaskIntoConstraints = false
//        temp.clipsToBounds = true
//        temp.backgroundColor = .yellow
//        return temp
//    }()
    
//    private lazy var mainStackView: UIStackView = {
//        let temp = UIStackView()
//        temp.addArrangedSubview(cellInfo)
//        temp.translatesAutoresizingMaskIntoConstraints = false
//        temp.alignment = .center
//        temp.distribution = .fill
//        temp.axis = .horizontal
//        temp.spacing = 20
//        return temp
//    }()
    
//    private lazy var imageViewComponent: CustomImageViewComponentContainer = {
//        let temp = CustomImageViewComponentContainer()
//        temp.translatesAutoresizingMaskIntoConstraints = false
//        temp.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        temp.widthAnchor.constraint(equalToConstant: 50).isActive = true
//        temp.layer.cornerRadius = 4
//        temp.layer.shadowColor = UIColor.black.cgColor
//        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
//        temp.layer.shadowRadius = 4
//        temp.layer.shadowOpacity = 0.6
//        return temp
//    }()
    
   

  
    
    
//    func setData(by value: CharacterResults) {
//        guard let data = value as? ViewCellData else { return }
//       // imageViewComponent.setData(by: data.imageData)
//        cellInfo.setData(by: data.cellInfo)
//    }
    
  
    

    
}




