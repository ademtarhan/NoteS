//
//  NoteLocalModel+CoreDataProperties.swift
//  NoteS
//
//  Created by Adem Tarhan on 8.07.2022.
//
//

import Foundation
import CoreData


extension NoteLocalModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteLocalModel> {
        return NSFetchRequest<NoteLocalModel>(entityName: "NoteLocalModel")
    }

    @NSManaged public var createDate: Date?
    @NSManaged public var text: String?

}

extension NoteLocalModel : Identifiable {

}
