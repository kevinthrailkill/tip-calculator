//
//  SettingsViewController.swift
//  Tip With Friends
//
//  Created by Kevin Thrailkill on 3/3/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "percentLocation")
        self.settingsTipControl.selectedSegmentIndex = intValue
        
        
        let font = UIFont (name: "Courier New", size: 12)
        self.settingsTipControl.setTitleTextAttributes([NSFontAttributeName: font!],
                                                 for: .normal)

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        let defaults = UserDefaults.standard
        
        defaults.set(self.settingsTipControl.selectedSegmentIndex, forKey: "percentLocation")
        defaults.synchronize()
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
