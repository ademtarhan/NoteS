//
//  NoteLocalModel+CoreDataClass.swift
//  NoteS
//
//  Created by Adem Tarhan on 7.07.2022.
//
//

import Foundation
import CoreData

@objc(NoteLocalModel)
public class NoteLocalModel: NSManagedObject {

}

extension NoteLocalModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteLocalModel> {
        return NSFetchRequest<NoteLocalModel>(entityName: "NoteLocalModel")
    }

    @NSManaged public var createDate: Date?
    @NSManaged public var text: String?

}

extension NoteLocalModel : Identifiable {

}
