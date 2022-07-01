//
//  SigInViewController.swift
//  NoteS
//
//  Created by Adem Tarhan on 1.07.2022.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class SignInViewController: UIViewController {

    @IBOutlet weak var textfieldEmail: UITextField!
    
    @IBOutlet weak var textfieldPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func buttonSignIn(_ sender: Any) {
        if textfieldEmail.text?.isEmpty == true{
            print("e-mail textfield is empty")
            return
        }
        if textfieldPassword.text?.isEmpty == true{
            print("password textfield is empty")
            return
        }
        signIn()
    }
    
    
    func signIn(){
        Auth.auth().createUser(withEmail: textfieldEmail.text!, password: textfieldPassword.text!) { authResult, error in
            guard let user = authResult?.user,error == nil else{
                print("Error:\(error?.localizedDescription)")
                return
            }
        }
        
        
        let loginVC = LogInViewController(nibName: "LogInViewController", bundle: nil)
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true, completion: nil)
        
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
