//
//  ViewController.swift
//  Calculator
//
//  Created by Chris Archibald on 11/30/15.
//  Copyright © 2015 Chris Archibald. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //All number functions call this function.
    @IBAction func numericPressed(sender: AnyObject) {
        var result: Int = Int(resultLabel.text!)!
        //If the user wants 52 they first push 5.
        //When they push 2 we move the 5 up a place 50, and then add 2 = 52
        result = result * 10 + sender.tag!
        resultLabel.text = "\(result)"
    }

}

