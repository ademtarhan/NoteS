//
//  HomeRouter.swift
//  NoteS
//
//  Created by Adem Tarhan on 7.07.2022.
//

import Foundation
import UIKit


protocol HomeRouter: AnyObject{
    var view: HomeViewController? {get set}
}

class HomeRouterImpl: HomeRouter{
    var view: HomeViewController?
    
    private let factory: Factory
    
    init(factory: Factory) {
        self.factory = factory
    }
    
    
    func navigateToAdd(){
        let destination = factory.add
        guard let nextViewController = destination as? UIViewController,
              let homeViewController = view as? UIViewController else {return}
        
        nextViewController.modalTransitionStyle = .coverVertical
        nextViewController.modalPresentationStyle = .fullScreen
        homeViewController.present(nextViewController, animated: true, completion: nil)
    }
    
}
