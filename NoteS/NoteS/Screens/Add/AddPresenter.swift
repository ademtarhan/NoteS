//
//  AddPresenter.swift
//  NoteS
//
//  Created by Adem Tarhan on 5.07.2022.
//

import Foundation


protocol AddPresenter: AnyObject{
    var view: AddViewController? {get set}
    var interactor: AddInteractor? {get set}
    var router: AddRouter? {get set}
}

class AddPresenterImpl: AddPresenter{
    var view: AddViewController?
    var interactor: AddInteractor?
    var router: AddRouter?
}
