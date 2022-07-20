//
//  LocalModel+CoreDataProperties.swift
//  NoteS
//
//  Created by Adem Tarhan on 14.07.2022.
//
//

import Foundation
import CoreData


extension LocalModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<LocalModel> {
        return NSFetchRequest<LocalModel>(entityName: "LocalModel")
    }

    @NSManaged public var createDate: Date?
    @NSManaged public var text: String?

}

extension LocalModel : Identifiable {

}
