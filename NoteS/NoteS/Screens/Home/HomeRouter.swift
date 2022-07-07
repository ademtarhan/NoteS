//
//  HomeRouter.swift
//  NoteS
//
//  Created by Adem Tarhan on 7.07.2022.
//

import Foundation


protocol HomeRouter: AnyObject{
    var view: HomeViewController? {get set}
}

class HomeRouterImpl: HomeRouter{
    var view: HomeViewController?
    
    private let factory: Factory
    init(factory: Factory) {
        self.factory = factory
    }
    
}
