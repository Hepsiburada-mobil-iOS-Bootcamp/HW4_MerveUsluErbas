////
////  MainViewController.swift
////  HW4_Merve_RickandMorty
////
////  Created by Cokomel on 11.10.2021.
////
//
//import UIKit
//
//class Main2Controller : BaseViewController, UICollectionViewDataSource<MainViewModel> {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    , UICollectionViewDataSource
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//
//
//
//    deinit {
//        print("DEINIT CharacterListViewController")
//    }
//
//    //private var mainComponent: mainComponent!
//   // private var mainComponent: CharacterListView!
//
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
//
//
//    override func prepareViewControllerConfigurations() {
//        super.prepareViewControllerConfigurations()
//
//        addmainComponent()
//
//       // subscribeViewModelListeners()
//
//        // fire getting data
//        viewModel.getCharacterList()
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(true, animated: true)
//    }
//
//    private func addmainComponent() {
//
////        mainComponent = CharacterListView()
////        mainComponent.backgroundColor = .yellow
////        mainComponent.translatesAutoresizingMaskIntoConstraints = false
////        mainComponent.delegateListProtocol = viewModel
////
//
//        view.addSubview(collectionView)
//
//        NSLayoutConstraint.activate([
//
//            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
//            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//
//        ])
//    }
//
////    private func subscribeViewModelListeners() {
////
////        viewModel.subscribeState { [weak self] state in
////            switch state {
////            case .done:
////                print("data is ready")
////                self?.mainComponent.reloadTableView()
////            case .loading:
////                print("data is getting")
////            case .failure:
////                print("errror")
////                // show alert popup
////            }
////        }
////    }
////
//
//
//
//}
