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
    func saveData() -> Note
}

class AddInteractorImpl: AddInteractor{
    
    var persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func saveData() -> Note{
        let noteDescription = NSEntityDescription.entity(forEntityName: "Note", in: persistentContainer)
        let newItem = Note(entity: noteDescription!, insertInto: persistentContainer)
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


