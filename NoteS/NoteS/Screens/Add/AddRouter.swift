//
//  AddRouter.swift
//  NoteS
//
//  Created by Adem Tarhan on 8.07.2022.
//

import Foundation


protocol AddRouter: AnyObject{
    var view: AddViewController? {get set}
}

class AddRouterImpl: AddRouter{
    var view: AddViewController?
}
