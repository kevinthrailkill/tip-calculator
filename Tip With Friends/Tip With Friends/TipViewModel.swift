//
//  TipViewModel.swift
//  Tip With Friends
//
//  Created by Kevin Thrailkill on 3/3/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import UIKit

class TipViewModel: NSObject {
    
    let tipString : String
    let totalString : String
    let total2String : String
    let total3String : String
    let total4String : String
    
    init(tipModel: TipModel) {
        self.tipString = String(format:"$%.2f"
            ,tipModel.tip)
        self.totalString = String(format:"$%.2f"
            ,tipModel.total)
        self.total2String = String(format:"$%.2f"
            ,tipModel.total/2.0)
        self.total3String = String(format:"$%.2f"
            ,tipModel.total/3.0)
        self.total4String = String(format:"$%.2f"
            ,tipModel.total/4.0)
        
        print(self.tipString)
        print(self.totalString)
        
    }
    

}
