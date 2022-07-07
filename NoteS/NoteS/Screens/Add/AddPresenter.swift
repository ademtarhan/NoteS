//
//  AddPresenter.swift
//  NoteS
//
//  Created by Adem Tarhan on 5.07.2022.
//

import Foundation


protocol AddPresenter: AnyObject{
    var interactor: AddInteractor? {get set}
    func saveDatas() -> Note
}

class AddPresenterImpl: AddPresenter{
    var interactor: AddInteractor?
    
    func saveDatas() -> Note{
        return (interactor?.saveData())!
    }
}
