//
//  MainViewController.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 11.10.2021.
//

import UIKit

class MainViewController : BaseViewController<MainViewModel> {
    
    
    deinit {
        print("DEINIT CharacterListViewController")
    }
    
    //private var mainComponent: mainComponent!
    private var mainComponent: CharacterListView!

    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
       
        addmainComponent()
    
        subscribeViewModelListeners()
        
        // fire getting data
        viewModel.getCharacterList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        DispatchQueue.main.async {
       //     self.mainComponent.collectionView.reloadData()
            print("RELOADD ETTİM")
        }
        
        
       
    }
    
    private func addmainComponent() {
        
        mainComponent = CharacterListView()
        mainComponent.backgroundColor = .yellow
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        mainComponent.delegateListProtocol = viewModel
       

        view.addSubview(mainComponent)

        NSLayoutConstraint.activate([

            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
    
    private func subscribeViewModelListeners() {

        viewModel.subscribeState { [weak self] state in
            switch state {
            case .done:
                print("data is ready")
                self?.mainComponent.reloadCollectionView()
                print("Reload ettim")
            case .loading:
                print("data is getting")
            case .failure:
                print("errror")
                // show alert popup
            }
        }
    }

    
    
    
}
