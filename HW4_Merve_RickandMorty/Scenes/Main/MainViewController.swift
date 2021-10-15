//
//  MainViewController.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 11.10.2021.
//

import UIKit

class MainViewController : BaseViewController<MainViewModel>, UIScrollViewDelegate  {
    
    deinit {
        print("DEINIT CharacterListViewController")
    }
    
    private var mainComponent: CharacterListView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        addmainComponent()
        subscribeViewModelListeners()
        viewModel.getCharacterList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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



