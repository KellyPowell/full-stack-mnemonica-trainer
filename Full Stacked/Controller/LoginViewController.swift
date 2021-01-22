//
//  LoginViewController.swift
//  Full Stacked 3
//
//  Created by Kelly Powell on 1/21/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                
                if error != nil {
                    print(error!._code)
                    self.handleError(error!)   // use the handleError method
                    return
                }
                //successfully logged in the user
                //Navigate to the ChatViewController
                self.performSegue(withIdentifier: "LoginToTest", sender: self)
            })
        }
        
    }
}



