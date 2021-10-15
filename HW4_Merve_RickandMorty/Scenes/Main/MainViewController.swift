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
    
    //private var mainComponent: mainComponent!
    private var mainComponent: CharacterListView!
    var mainScrollView: UIScrollView?
    //let searchController = UISearchController()

    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
       
        addmainComponent()
    
        subscribeViewModelListeners()
        mainScrollView?.delegate = self
        
        
        // fire getting data
        viewModel.getCharacterList()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
      
        
        
       
    }
    
    
   
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
          
        print("GİRDİİM")
        print(self.mainScrollView?.contentOffset.y)
          let position = scrollView.contentOffset.y
        let screenSize: CGRect = UIScreen.main.bounds
            var tableViewContentSize = screenSize.height
        print(tableViewContentSize)
          var scrollViewSize = scrollView.frame.size.height
    print(scrollViewSize)
        print(position)
  //        print("position \(position)")
  //        print("tableViewContentSize \(tableViewContentSize)")
  //        print("scrollViewSize \(scrollViewSize)")
         
  //        print(position)
          if tableViewContentSize != 0 {
          if position > (tableViewContentSize-scrollViewSize){
              print("fetching")
      
              viewModel.getCharacterList()
        
              
              
              
          }
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


    
