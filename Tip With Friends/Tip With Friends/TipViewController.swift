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
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    
    var tipController : TipController?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tipController = TipController()
        
        


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateView), name: NSNotification.Name(rawValue: "updateView"), object: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool){
        super.viewWillDisappear(animated)
        
        if self.navigationController!.viewControllers.contains(self) == false  //any other hierarchy compare if it contains self or not
        {
            // the view has been removed from the navigation stack or hierarchy, back is probably the cause
            // this will be slow with a large stack however.
            
            NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "updateView"), object: nil)
        }
    }
    
    func updateView() {
        
        self.tipLabel!.text = self.tipController!.tipViewModel?.tipString
        self.totalLabel!.text = self.tipController!.tipViewModel?.totalString

        
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
