//
//  HomeAssembly.swift
//  NoteS
//
//  Created by Adem Tarhan on 7.07.2022.
//

import Foundation
import UIKit
import Swinject

class HomeAssembly: Assembly{
    func assemble(container: Container) {
        container.register(HomeViewController.self){ reg in
            let viewController = HomeViewControllerImpl(nibName: "HomeViewController", bundle: nil)
            let presenter = reg.resolve(HomePresenter.self)!
            let interactor = reg.resolve(HomeInteractor.self)!
            let router = reg.resolve(HomeRouter.self)!
            
            presenter.view = viewController as! HomeViewController
            presenter.router = router
            presenter.interactor = interactor
            interactor.presenter = presenter
            viewController.presenter = presenter
            router.view = viewController as! HomeViewController
            return viewController as! HomeViewController
        }
        
        container.register(HomePresenter.self){ _ in
            HomePresenterImpl()
        }
        container.register(HomeInteractor.self){_ in
            HomeInteractorImpl()
        }
        container.register(HomeRouter.self){reg in
            HomeRouterImpl(factory: reg.resolve(Factory.self)!)
        }
        
    }
}
