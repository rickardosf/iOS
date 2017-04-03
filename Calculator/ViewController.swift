//
//  ViewController.swift
//  Calculator
//
//  Created by Ricardo Santos filho on 3/26/17.
//  Copyright © 2017 Ricardo S. F. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMath = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    @IBAction func numbers(_ sender: UIButton)
    {
        if performingMath == true {
            label.text = String (sender.tag-1)
            numberOnScreen = Double(label.text!)!
            performingMath = false;
        }else
        {
            label.text = label.text! + String (sender.tag-1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton)
    {
        if label.text != "" && sender.tag != 11 && sender.tag != 16
        {
            previousNumber = Double(label.text!)!
            
            if sender.tag == 12 // divide
            {
                label.text = "/";
            }
            else if sender.tag == 13 // mutiplica
            {
                label.text = "x";
            }
            else if sender.tag == 14 // subtrai
            {
                label.text = "-";
            }
            else if sender.tag == 15 // soma
            {
                label.text = "+";
            }
            operation = sender.tag;
            performingMath = true;
        }
            else if sender.tag == 16
        {
            if operation == 12
            {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13
            {
             label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14
            {
             label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15
            {
             label.text = String(previousNumber + numberOnScreen)
            }else if operation == 17{
                return porcentagem();
            }
        }
        else if sender.tag == 11
        {
            label.text = ""
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
        }
    }
    
    func porcentagem (){
        if operation == 17 {
            if operation == 12 {
                label.text = String(previousNumber / numberOnScreen / 100)
            }
            else if operation == 13{
                label.text = String(previousNumber * numberOnScreen / 100)
            }else if operation == 14{
                label.text = String(previousNumber - numberOnScreen / 100)
            }else if operation == 15{
                label.text = String(previousNumber + numberOnScreen / 100)
            }else{
                label.text = String(previousNumber / 100)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

