//
//  Router.swift
//  NoteS
//
//  Created by Adem Tarhan on 1.07.2022.
//

import Foundation
import Swinject

protocol Factory{
    var home: HomeViewController {get}
    var add: AddViewController {get}
}


class FactoryImple: Factory{
    private let assembler: Assembler
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    var home: HomeViewController {assembler.resolver.resolve(HomeViewController.self)!}
    var add: AddViewController { assembler.resolver.resolve(AddViewController.self)!}


}
