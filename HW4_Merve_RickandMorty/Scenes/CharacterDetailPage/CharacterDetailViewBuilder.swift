////
////  CharacterDetailBuilder.swift
////  HW4_Merve_RickandMorty
////
////  Created by Cokomel on 15.10.2021.
////
//
//import Foundation
//class CharacterDetailViewBuilder {
//    
//    
//    class func build() -> UIViewController {
//        
//        let viewModel = CharacterDetailViewModel()
//        let viewController = CharacterDetailViewController(viewModel: viewModel)
//        let navigationViewController = UINavigationController(rootViewController: viewController)
//        viewController.title = "RICK AND MORTY"
//        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
//        
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.backgroundColor = .purple
//        viewController.navigationController?.navigationBar.standardAppearance = appearance;
//        viewController.navigationController?.navigationBar.scrollEdgeAppearance = viewController.navigationController?.navigationBar.standardAppearance
//        
//        return navigationViewController
//        
//        
//    }
//}
