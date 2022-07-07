//
//  HomePresenter.swift
//  NoteS
//
//  Created by Adem Tarhan on 1.07.2022.
//

import Foundation


protocol HomePresenter: AnyObject{
    var view: HomeViewController? {get set}
    var interactor: HomeInteractor? {get set}
    var router: HomeRouter? {get set}
}

class HomePresenterImpl: HomePresenter{
    var view: HomeViewController?
    
    var interactor: HomeInteractor?
    
    var router: HomeRouter?
    
    
}
