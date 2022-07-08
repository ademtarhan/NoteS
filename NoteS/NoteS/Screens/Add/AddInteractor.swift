//
//  AddInteractor.swift
//  NoteS
//
//  Created by Adem Tarhan on 5.07.2022.
//

import Foundation
import CoreData
import UIKit

protocol AddInteractor: AnyObject{
    var presenter: AddPresenter? {get set}
    func saveData() -> NoteLocalModel
}

class AddInteractorImpl: AddInteractor{
    var presenter: AddPresenter?
    
    var persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveData() -> NoteLocalModel{
        let noteDescription = NSEntityDescription.entity(forEntityName: "Note", in: persistentContainer)
        let newItem = NoteLocalModel(entity: noteDescription!, insertInto: persistentContainer)
        do{
            if persistentContainer.hasChanges{
                try persistentContainer.save()
            }
        }catch{
            print("don't saved")
        }
        return newItem
    }
}


