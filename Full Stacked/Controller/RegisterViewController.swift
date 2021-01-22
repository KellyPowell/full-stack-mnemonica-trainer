//
//  RegisterViewController.swift
//  Full Stacked 3
//
//  Created by Kelly Powell on 1/21/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        let signUpManager = FirebaseAuthManager()
           if let email = emailTextField.text, let password = passwordTextField.text {
               signUpManager.createUser(email: email, password: password) {[weak self] (success) in
                   guard let `self` = self else { return }
                   var message: String = ""
                   if (success) {
                       message = "User was sucessfully created."
                   } else {
                   // message = signUpManager.alertUser(errorCode: <#T##AuthErrorCode#>)
                    print("error")
                   }
                   let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                   alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertController, animated: true)
               }
           }

        
//        if let email =  emailTextField.text, let password = passwordTextField.text {
//            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in if let e = error {
//            print(e)
//            } else {
//                //Navigate to the ChatViewController
//                self.performSegue(withIdentifier: "RegisterToTest", sender: self)
//            }
//        }
//        }
    }
    
    
}
