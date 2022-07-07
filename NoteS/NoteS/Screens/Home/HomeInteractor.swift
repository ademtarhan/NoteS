//
//  HomeInteractor.swift
//  NoteS
//
//  Created by Adem Tarhan on 1.07.2022.
//

import Foundation


protocol HomeInteractor: AnyObject{
    var presenter: HomePresenter? {get set}
}

class HomeInteractorImpl: HomeInteractor{
    var presenter: HomePresenter?
    
    
}
