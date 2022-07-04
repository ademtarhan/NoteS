//
//  Router.swift
//  NoteS
//
//  Created by Adem Tarhan on 1.07.2022.
//

import Foundation

class Router{
    public static var shared = Router()
    
    var add: AddViewController{
        AddViewController(nibName: "AddViewController", bundle: nil)
    }
    
    var home: HomeViewController{
        HomeViewController(nibName: "HomeViewController", bundle: nil)
    }
    
    var signin: SignInViewController{
        SignInViewController(nibName: "SignInViewController", bundle: nil)
    }
    var login : LogInViewController{
        LogInViewController(nibName: "LogInViewController", bundle: nil)
    }
    
    
}
