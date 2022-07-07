//
//  AddViewController.swift
//  NoteS
//
//  Created by Adem Tarhan on 4.07.2022.
//

import UIKit
import CoreData

protocol AddViewController: AnyObject{
    var presenter: AddPresenter? {get set}
}


class AddViewControllerImpl: UIViewController,AddViewController {
    var presenter: AddPresenter?
    var notes = [Note]()
    

    var persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet weak var textViewNoteContext: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Finished", style: .plain, target: self, action: #selector(buttonFinished))
    }

    @objc func buttonFinished(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Note", in: context)
        let newNote = Note(entity: entity!, insertInto: context)
        newNote.noteText = textViewNoteContext.text
        do {
            try context.save()
            notes.append(newNote)
        } catch {
            print("Not Saved")
            return
        }
        navigationController?.popViewController(animated: true)
    }
    
    func getAllNotes(){
        do {
            let note = try persistentContainer.fetch(Note.fetchRequest())
        } catch {
            print("Not Readed")
            return
        }
    }
    
    
    func createdNote(context: String){
        var note = Note(context: persistentContainer)
        note.noteText = context
        note.noteDate = Date()
        do {
            try persistentContainer.save()
        } catch {
            print("Not Created")
            return
        }
    }
    
    func deleteNote(note: Note){
        persistentContainer.delete(note)
        do {
            try persistentContainer.save()
        } catch {
            print("Not Deleted")
            return
        }
    }
    
    func updateData(note: Note, context: String) {
        note.noteText = context
        do {
            try persistentContainer.save()
        } catch {
            print("Not Updated")
            return
        }
    }
}
