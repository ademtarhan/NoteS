//
//  FactoryAssembly.swift
//  NoteS
//
//  Created by Adem Tarhan on 7.07.2022.
//

import Foundation
import Swinject


class FactoryAssembly: Assembly{
    
    
    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func assemble(container: Container) {
        container.register(FactoryAssembly.self) { _ in
            FactoryAssembly(assembler: self.assembler)
        }
    }
    
}
