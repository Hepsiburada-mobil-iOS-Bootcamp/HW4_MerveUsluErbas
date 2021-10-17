////
////  CharacterDetailBuilder.swift
////  HW4_Merve_RickandMorty
////
////  Created by Cokomel on 15.10.2021.
////
//
import UIKit
class CharacterDetailViewBuilder {
    
    
    class func build(with characterId : Int) -> UIViewController {
        
        let viewModel = CharacterDetailViewModel(characterId: characterId)
        let viewController = CharacterDetailViewController(viewModel: viewModel)
        let navigationViewController = UINavigationController(rootViewController: viewController)
       
        viewController.title = "CHARACTER DETAILS"
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .darkGray
        viewController.navigationController?.navigationBar.standardAppearance = appearance;
        viewController.navigationController?.navigationBar.scrollEdgeAppearance = viewController.navigationController?.navigationBar.standardAppearance
        
        return navigationViewController
        
        
    }
}
