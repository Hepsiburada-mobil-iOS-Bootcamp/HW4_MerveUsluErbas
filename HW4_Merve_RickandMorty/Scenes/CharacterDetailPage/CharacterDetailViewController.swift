//
//  CharacterDetailBuilder.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 15.10.2021.
//

import Foundation
import UIKit

class CharacterDetailViewController : BaseViewController<CharacterDetailViewModel> {
    
    
    deinit {
        print("DEINIT CharacterListViewController")
    }
    
    private var mainComponent: DetailPageView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        
        addmainComponent()
        viewModel.getCharacterDetailList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    private func addmainComponent() {
        
        mainComponent = DetailPageView()
        mainComponent.backgroundColor = .yellow
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        mainComponent.delegateCharacterDetail = viewModel
        
        
        view.addSubview(mainComponent)
        NSLayoutConstraint.activate([
            
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        mainComponent.reloadTableView()
    }
    
    
    
    
}
