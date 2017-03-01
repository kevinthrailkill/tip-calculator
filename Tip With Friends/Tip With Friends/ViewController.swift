//
//  ViewController.swift
//  Tip With Friends
//
//  Created by Kevin Thrailkill on 3/1/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func inTap(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
        
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18,0.20,0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text! = String(format:"$%.2f"
,tip)
        totalLabel.text! = String(format:"$%.2f"
            ,total)

    }

    
}

