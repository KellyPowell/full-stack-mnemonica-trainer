//
//  FirebaseAuth.swift
//  Full Stacked 3
//
//  Created by Kelly Powell on 1/22/21.
//

import FirebaseAuth
import UIKit

class FirebaseAuthManager {
    
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Bool) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if let user = authResult?.user {
                print(user)
                completionBlock(true)
            } else {
                completionBlock(false)
                
            }
        }
    }
    
    func alertUser(errorCode: AuthErrorCode) -> String {
        
        switch errorCode {
        
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
