//
//  LogInViewController.swift
//  NoteS
//
//  Created by Adem Tarhan on 1.07.2022.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class LogInViewController: UIViewController {

    @IBOutlet weak var textfieldEmail: UITextField!
    
    @IBOutlet weak var textfieldPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func buttonLogIn(_ sender: Any) {
        validateTextField()
    }
    
    func validateTextField() {
        if textfieldEmail.text?.isEmpty == true{
            print("e-mail textfield is empty")
            return
        }
        if textfieldPassword.text?.isEmpty == true{
            print("password textfield is empty")
            return
        }
        
        logIn()
    }
    
    func logIn() {
        Auth.auth().signIn(withEmail: textfieldEmail.text!, password: textfieldPassword.text!) { authResult, error in
            if let error = error{
                print(error.localizedDescription)
            }
            self.checkUserInfo()
        }
    }
    
    
    func checkUserInfo() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.uid)
            let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
            homeVC.modalPresentationStyle = .fullScreen
            self.present(homeVC, animated: true, completion: nil)
        }
        
        
    }
    
    
    @IBAction func buttonCreateAccount(_ sender: Any) {
        let siginVC = SignInViewController()
        present(siginVC, animated: true, completion: nil)
    }
    

}
