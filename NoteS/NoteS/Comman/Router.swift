//
//  Router.swift
//  NoteS
//
//  Created by Adem Tarhan on 1.07.2022.
//

import Foundation

class Router{
    public static var shared = Router()
    
    var signin: SignInViewController{
        SignInViewController(nibName: "SignInViewController", bundle: nil)
    }
    var login : LogInViewController{
        LogInViewController(nibName: "LogInViewController", bundle: nil)
    }
    
    
}
