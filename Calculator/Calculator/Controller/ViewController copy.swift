//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!

    private var isFinishedTYpingNumber: Bool = true

    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
              fatalError("Cannot convert display label text to a Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }

    private var calculator = CalcualtorLogic()

    @IBAction func calcButtonPRessed(_ sender: UIButton) {

        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)

        if let calcMethod = sender.currentTItle {

            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }

        }

    }

    @IBAction func numButtonPressed(_ sender: UIButton) {

        if let numValue = sender.currentTitle {

            if isFinishedTypingNumber {
                displayLabel.text = numValue
                isFinishedTypingNumber = false
            } else {

                if numValue == "." {

                    let isInt = floor(displayValue) == displayValue

                    if !isInt {
                        return
                    }

                }
                displayLabel.text = displayLabel.text! + numValue
            }

        }

    }

}