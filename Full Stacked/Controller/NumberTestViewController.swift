//
//  NumberTestViewController.swift
//  Full Stacked
//
//  Created by Kelly Powell on 1/17/21.
//

import UIKit

class NumberTestViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var hintButton: UIButton!
    @IBOutlet weak var hintLabel: UILabel!
    
    var testBrain = TestBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testBrain.nextCard()
        numberLabel.isHidden = true
        updateUI()
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        let userAnswer = answerField.text?.uppercased()
        if testBrain.checkNumberAnswer(userAnswer ?? "0") {
            testBrain.nextCard()
            updateUI()
        } else {
            answerField.text = "Try again!"
        }
    }
    
    @IBAction func hintPressed(_ sender: UIButton) {
        hintLabel.text = testBrain.getHintText()
        hintLabel.isHidden = false
    }
    
    @objc func updateUI() {
        numberLabel.text = testBrain.getDisplayNumber()
        numberLabel.isHidden = false
        hintLabel.text = ""
        hintLabel.isHidden = true
        answerField.text = ""
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
