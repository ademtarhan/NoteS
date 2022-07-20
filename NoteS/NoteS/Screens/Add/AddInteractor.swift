//
//  AddInteractor.swift
//  NoteS
//
//  Created by Adem Tarhan on 5.07.2022.
//

import CoreData
import Foundation
import UIKit

protocol AddInteractor: AnyObject {
    var presenter: AddPresenter? { get set }
}

class AddInteractorImpl: AddInteractor {
    var presenter: AddPresenter?
}
