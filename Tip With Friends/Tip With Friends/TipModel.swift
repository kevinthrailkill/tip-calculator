//
//  TipModel.swift
//  Tip With Friends
//
//  Created by Kevin Thrailkill on 3/3/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class TipModel: NSObject {
    
    let tip : Double
    let total: Double
    private let tipPercentages = [0.18,0.20,0.25]
    
    init(bill: Double, tipPercentInt: Int){
        self.tip = bill * tipPercentages[tipPercentInt]
        self.total = bill + tip
        
    }

}
