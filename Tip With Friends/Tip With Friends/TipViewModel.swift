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
    
    init(tipModel: TipModel) {
        self.tipString = String(format:"$%.2f"
            ,tipModel.tip)
        self.totalString = String(format:"$%.2f"
            ,tipModel.total)
        
        print(self.tipString)
        print(self.totalString)
        
    }
    

}
