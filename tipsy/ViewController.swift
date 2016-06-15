//
//  ViewController.swift
//  tipsy
//
//  Created by Angela Chen on 6/14/16.
//  Copyright © 2016 Angela Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true); // removes keyboard when tap outside bill
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipPercentages = [defaults.doubleForKey("default_tip_percentage"), 10, 15, 20]
        
        let bill = Double(billField.text!) ?? 0
        
        let tipValue = tipPercentages[tipControl.selectedSegmentIndex]
        
        let tip = bill * (tipValue / 100)
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

