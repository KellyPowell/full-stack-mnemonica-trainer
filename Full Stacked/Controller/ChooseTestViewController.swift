//
//  ViewController.swift
//  Full Stacked
//
//  Created by Kelly Powell on 1/17/21.
//

import UIKit
import Firebase

class ChooseTestViewController: UIViewController {

    @IBOutlet weak var numberTestButton: UIButton!
    @IBOutlet weak var cardTestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }

    @IBAction func numberButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToNumberTest", sender: self)
    }
    
    @IBAction func cardButtonPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToCardTest", sender: self)
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
         do {
            try Auth.auth().signOut()


        } catch let signOutError as NSError {
            print("Error signing out: @",  signOutError)
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToNumberTest" {
//
//        } else if segue.identifier == "goToCardTest" {
//
//        }
//    }
}

