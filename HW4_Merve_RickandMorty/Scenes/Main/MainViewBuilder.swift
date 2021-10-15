//
//  MainViewBuilder.swift
//  HW4_Merve_RickandMorty
//
//  Created by Cokomel on 11.10.2021.
//

import Foundation
import UIKit

class MainViewBuilder {
    
    
    class func build() -> UIViewController {
        
        let characterListFormatter = DataFormatter()
        let viewModel = MainViewModel(formatter: characterListFormatter)
        let viewController = MainViewController(viewModel: viewModel)
        let navigationViewController = UINavigationController(rootViewController: viewController)
        viewController.title = "RICK AND MORTY"
        viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .purple
        viewController.navigationController?.navigationBar.standardAppearance = appearance;
        viewController.navigationController?.navigationBar.scrollEdgeAppearance = viewController.navigationController?.navigationBar.standardAppearance
    
        return navigationViewController
        
        
    }
}
