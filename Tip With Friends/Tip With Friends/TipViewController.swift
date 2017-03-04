//
//  TipViewController.swift
//  Tip With Friends
//
//  Created by Kevin Thrailkill on 3/3/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    var tipController : TipController?

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var total4PeopleLabel: UILabel!
    @IBOutlet weak var total3PeopleLabel: UILabel!
    @IBOutlet weak var total2PeopleLabel: UILabel!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipController = TipController()
        
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "percentLocation")
        self.tipPercentControl.selectedSegmentIndex = intValue
        
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
        
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "percentLocation")
        self.tipPercentControl.selectedSegmentIndex = intValue
        self.calculateTip(self)
        
        
        self.billField.becomeFirstResponder()
    }
    

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")

        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: NSNotification.Name(rawValue: "updateView"), object: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        print("view will disappear")
        
        print("remove oberver")
        view.endEditing(true)

        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "updateView"), object: nil)
        
        
    }
    
    func updateView() {
        
        self.tipLabel!.text = self.tipController!.tipViewModel?.tipString
        self.totalLabel!.text = self.tipController!.tipViewModel?.totalString
        self.total2PeopleLabel!.text = self.tipController!.tipViewModel?.total2String
        self.total3PeopleLabel!.text = self.tipController!.tipViewModel?.total3String
        self.total4PeopleLabel!.text = self.tipController!.tipViewModel?.total4String

        
        //Insert code here
    }
    
    @IBAction func inTap(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        self.tipController!.calculateTip(billAmount: Double(billField.text!) ?? 0, tipLocation: tipPercentControl.selectedSegmentIndex)
        
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
