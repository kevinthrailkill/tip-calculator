//
//  TipController.swift
//  Tip With Friends
//
//  Created by Kevin Thrailkill on 3/3/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class TipController: NSObject {
    
    var tipViewModel : TipViewModel?
    
    func calculateTip(billAmount: Double, tipLocation: Int){
        
        let tipModel = TipModel(bill: billAmount, tipPercentInt: tipLocation)
        
        self.tipViewModel = TipViewModel(tipModel: tipModel)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "updateView"), object: nil)
        print("here")
        
    }
    

}
