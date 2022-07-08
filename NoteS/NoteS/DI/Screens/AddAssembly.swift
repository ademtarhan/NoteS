//
//  AddAssembly.swift
//  NoteS
//
//  Created by Adem Tarhan on 7.07.2022.
//

import Foundation
import Swinject
import UIKit

class AddAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AddViewController.self) { reg in
            let viewController: AddViewController = AddViewControllerImpl(nibName: "AddViewController", bundle: nil)
            let presenter = reg.resolve(AddPresenter.self)!
            let interactor = reg.resolve(AddInteractor.self)!
            let router = reg.resolve(AddRouter.self)!

            presenter.view = viewController
            presenter.interactor = interactor
            presenter.router = router
            interactor.presenter = presenter
            viewController.presenter = presenter
            router.view = viewController
            return viewController
        }

        container.register(AddPresenter.self) { _ in
            AddPresenterImpl()
        }
        container.register(AddInteractor.self) { _ in
            AddInteractorImpl()
        }
        container.register(AddRouter.self) { _ in
            AddRouterImpl()
        }
    }
}
