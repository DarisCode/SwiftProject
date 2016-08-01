//
//  ViewController.swift
//  GuessNumber
//
//  Created by Financialbrain on 2016/7/28.
//  Copyright © 2016年 DarisCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuess: UITextField!
    @IBOutlet weak var inputATextfield: UITextField!
    @IBOutlet weak var inputBTextfield: UITextField!
    @IBOutlet weak var logTextView: UITextView!
    
    var host = GuessNumberHost()
    var ai = GuessNumberAI()
    
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        logTextView.text = "Welcome,please guess it first.\n"
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func userGuessSumbitBtnPressed(sender: AnyObject)
    {
        guard let userGuessString = userGuess.text else
        {
            return
        }
        
        guard host.isValidNumber(userGuessString) else
        {
            logTextView.text! += "Invalid input:\(userGuessString)\n"
            return
        }
        
        guard let resultAB = host.userGuess(userGuessString) else
        {
            logTextView.text! += "Fail to handle input: \(userGuessString)\n"
            return
        }
        
        logTextView.text! += "User Guess [\(host.userGuessCounter)]: \(userGuessString) ==> \(resultAB.A)A,\(resultAB.B)B\n"
        
        
        ///User win
        if resultAB.A == host.MAX_NUMBERS
        {
            logTextView.text! += "User WIN the game! .\n"
            return
        }
        
        ///It's AI's turn to guess.
        guard let aiGuessString = ai.getAIGuess() else
        {
            logTextView.text! += "AI don't know hot to guess.\n"
            return
        
        }
        
        logTextView.text! += "AI Guess [\(ai.aiGuessCounter)]: \(aiGuessString)\n"
    }
    
    
    @IBAction func replyABBtnPressed(sender: AnyObject)
    {
        ///Check if the inputs are valid
        guard let replyA = inputATextfield.text else
        {
            logTextView.text! += "Field A should not be empty.\n"
            return
        }
        guard let replyB = inputBTextfield.text else
        {
            logTextView.text! += "Field B should not be empty.\n"
            return
        }
        
        guard let numberA = Int(replyA) else
        {
            logTextView.text! += "Field A is not valid. \n"
            return
        }
        
        guard let numberB = Int(replyB) else
        {
            logTextView.text! += "Field B is not valid. \n"
            return
        }
        
        /// Handle user's reply of AB
        
        guard let result = ai.handleUserReply(numberA, replyB: numberB) else
        {
            logTextView.text! += "AI don't know to handle the AB.\n"
            return
        }
        
        if result
        {
            logTextView.text! += "AI Win the game.\n"
            return
        }
        else
        {
            logTextView.text! += "==> \(numberA)A,\(numberB)B.\nYour turn to guess.\n"
            return
        }
    }
    
    @IBAction func restartGameBtnPressed(sender: AnyObject)
    {
        logTextView.text = "Game restarted, please guess it first.\n"
        /// New
        host = GuessNumberHost()
        ai = GuessNumberAI()
        
        ///Clear up the fields
        userGuess.text = ""
        inputATextfield.text = ""
        inputBTextfield.text = ""
        
    }
    
    
}

