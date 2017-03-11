//
//  InterfaceController.swift
//  Tip Watch Extension
//
//  Created by Kevin Thrailkill on 3/11/17.
//  Copyright © 2017 kevinthrailkill. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet var dollarPicker: WKInterfacePicker!
    @IBOutlet var centPicker: WKInterfacePicker!
    @IBOutlet var peoplePicker: WKInterfacePicker!
    @IBOutlet var percentPicker: WKInterfacePicker!
    
    
    @IBOutlet var tipLabel: WKInterfaceLabel!
    @IBOutlet var totalLabel: WKInterfaceLabel!
    @IBOutlet var splitLabel: WKInterfaceLabel!
    @IBOutlet var splitAmount: WKInterfaceLabel!
    
    @IBOutlet var tipTotalGroup: WKInterfaceGroup!
    
    @IBOutlet var splitGroup: WKInterfaceGroup!
    
    
    var dollar = 1
    var cent = 0
    var people = 0
    var percent = 0
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        var dollarItems: [WKPickerItem] = []
        for i in 1...200 {
            let item = WKPickerItem()
            item.title = String(i)
            dollarItems.append(item)
        }
        dollarPicker.setItems(dollarItems)
        
        var centItems: [WKPickerItem] = []
        for i in 0...99 {
            let item = WKPickerItem()
            item.title = String(i)
            centItems.append(item)
        }
        centPicker.setItems(centItems)
        
        var peopleItems: [WKPickerItem] = []
        for i in 0...3 {
            let item = WKPickerItem()
            item.title = String(i)
            peopleItems.append(item)
        }
        peoplePicker.setItems(peopleItems)
        
        var percentItems: [WKPickerItem] = []
        var item = WKPickerItem()
        item.title = String(18)
        percentItems.append(item)
        item = WKPickerItem()
        item.title = String(20)
        percentItems.append(item)
        item = WKPickerItem()
        item.title = String(25)
        percentItems.append(item)
        
        
        percentPicker.setItems(percentItems)
        
        
        tipTotalGroup.setHidden(true)
        
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func calculateTip() {
        
        let billAmount = Double(dollar) + Double(cent)/100.0
        
        
        let tipModel = TipModel(bill: billAmount, tipPercentInt: percent)
        
        tipLabel.setText(String(format:"$%.2f"
            ,tipModel.tip))
        totalLabel.setText(String(format:"$%.2f"
            ,tipModel.total))
        
        
        if(people != 0){
        
            
            
            splitLabel.setText("÷\(people+1)")
            splitAmount.setText(String(format:"$%.2f"
                ,tipModel.total/Double(people+1)))
            
            splitGroup.setHidden(false)
            
        }else{
            splitGroup.setHidden(true)
        }
        
        tipTotalGroup.setHidden(false)
        
    }
    @IBAction func onDollarChange(_ value: Int) {
        dollar = value + 1
        print("dollar \(dollar)")
    }
    @IBAction func onCentChange(_ value: Int) {
        cent = value
        print("cent \(cent)")
    }
    @IBAction func onFriendsChange(_ value: Int) {
        people = value
        print("people \(people)")
        
    }
    @IBAction func onPercentChange(_ value: Int) {
        
        percent = value
        print(percent)
        
    }
   
    
}
