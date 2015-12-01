//
//  ViewController.swift
//  Calculator
//
//  Created by Chris Archibald on 11/30/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var op: Int = 0
    var setZero: Bool = true
    var operand: Int = 0

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setZero = true
        op = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //All number functions call this function.
    @IBAction func numericPressed(sender: AnyObject) {
        if setZero {
            resultLabel.text = "0"
            setZero = false
        }
        
        var result: Int = Int(resultLabel.text!)!
        //If the user wants 52 they first push 5.
        //When they push 2 we move the 5 up a place 50, and then add 2 = 52
        result = result * 10 + sender.tag!
        resultLabel.text = "\(result)"
    }

    @IBAction func operatorPressed(sender: AnyObject) {
        //If they don't hit enter but do another operator we want to calulate the results
        if op != 0 {
            operand = calculateResult(myOperator: op)
            resultLabel.text = "\(operand)"
        } else {
            let result: Int = Int(resultLabel.text!)!
            operand = result
        }
        setZero = true
        op = sender.tag
    }
    
    @IBAction func equalsPressed(sender: AnyObject) {
        operand = calculateResult(myOperator: op)
        resultLabel.text = "\(operand)"
        op = 0
        setZero = true
    }

    @IBAction func clearPressed(sender: AnyObject) {
        resultLabel.text = "0"
    }
    
    func calculateResult(myOperator myOperator: Int) -> Int
    {
        var returnValue: Int = Int(resultLabel.text!)!
        switch(myOperator){
        case 1:
            returnValue = operand * returnValue
            break
        case 2:
            returnValue = operand / returnValue
            break
        case 3:
            returnValue = operand + returnValue
            break
        case 4:
            returnValue = operand - returnValue
            break
        default:
            break
        }
        return returnValue
    }
}

