//
//  TestBrain.swift
//  Mnemonica
//
//  Created by Kelly Powell on 1/16/21.
//

import Foundation

struct TestBrain {
    let mQuiz = TamarizStack
    
    
    var questionNumber = 0
    var displayNumber = 0
    var displayNumberAsString = ""
    var cardChosen = ""
    var hintText = ""
    
    
    // get our random number
    mutating func nextCard() {
        questionNumber = Int.random(in: 0..<mQuiz.count)
        displayNumber = questionNumber + 1
        displayNumberAsString = String(displayNumber)
        let chosenValue = mQuiz[questionNumber].value
        let chosenSuit = mQuiz[questionNumber].suit
        cardChosen = chosenValue + chosenSuit
    }
    
    // get the number to display on screen
    mutating func getDisplayNumber() -> String {
        return displayNumberAsString
    }
    
    // get the card name to display on screen
    mutating func getCardName() -> String {
        return cardChosen
    }
    
    // get the hint text
    mutating func getHintText() -> String {
        let hintText = mQuiz[questionNumber].hint
        return hintText
    }
    
    // Check to see if user's position answer is correct
    mutating func checkNumberAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == cardChosen {
            return true
        } else {
            return false
        }
        
    }
    
    // Check to see if user's card answer is correct
    mutating func checkCardAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == displayNumberAsString {
            return true
        } else {
            return false
        }
    }
    
}
