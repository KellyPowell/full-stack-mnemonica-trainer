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
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                
                if error != nil {
                    print(error!._code)
                    self.handleError(error!)      // use the handleError method
                    return
                }
                //successfully logged in the user
                //Navigate to the ChatViewController
                self.performSegue(withIdentifier: "RegisterToTest", sender: self)
            })
        }
        
    }
    
    
}

extension AuthErrorCode {
    var errorMessage: String {
        switch self {
        case .accountExistsWithDifferentCredential:
            return "Email already exists, log in."
        case .credentialAlreadyInUse:
            return("Email already exists, log in.")
        case .emailAlreadyInUse:
            return("Email already exists, log in.")
        case .internalError:
            return("Indicates an internal error occurred.")
        case .invalidEmail:
            return("Please enter a valid email.")
        case .keychainError:
            return("An error occurred while attempting to access the keychain.")
        case .missingEmail:
            return("Please provide valid email address.")
        case .networkError:
            return("A network error occurred.")
        case .sessionExpired:
            return("Session expired.")
        case .userDisabled:
            return("Indicates the user’s account is disabled on the server.")
        case .userMismatch:
            return("User mismatch, please log in.")
        case .userNotFound:
            return("User not found, please create account.")
        case .userTokenExpired:
            return("User token expired. Please log in.")
        case .weakPassword:
            return("Password must have at least 6 characters.")
        case .wrongPassword:
            return("Wrong password.")
        default:
            return("Unknown error occurred")
        }
    }
}


extension UIViewController{
    func handleError(_ error: Error) {
        if let errorCode = AuthErrorCode(rawValue: error._code) {
            print(errorCode.errorMessage)
            let alert = UIAlertController(title: "Error", message: errorCode.errorMessage, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alert.addAction(okAction)
            
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
}
