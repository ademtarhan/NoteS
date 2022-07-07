//
//  Note.swift
//  NoteS
//
//  Created by Adem Tarhan on 4.07.2022.
//

import CoreData
import Foundation

// public class Note : NSManagedObject{
//
// }
//
// extension Note {
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
//        return NSFetchRequest<Note>(entityName: "Note")
//    }
//
//    @NSManaged public var noteText: String?
//    @NSManaged public var noteDate: Date?
//
// }

@objc(Note)
class Note: NSManagedObject {
    @NSManaged var noteText: String?
    @NSManaged var noteDate: Date?
}
