//
//  SettingsViewController.swift
//  tipsy
//
//  Created by Angela Chen on 6/14/16.
//  Copyright © 2016 Angela Chen. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    var defaultExists = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tipSlider.setValue(Float(defaults.doubleForKey("default_tip_percentage")), animated: false)
        tipLabel.text = String(format: "%.0f%%", tipSlider.value)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sliderChange(sender: UISlider) {
        
        tipLabel.text = String(format: "%.0f%%", tipSlider.value)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(Double(tipSlider.value), forKey: "default_tip_percentage")
        defaults.synchronize()
        
        //tipSlider.setValue(Float(defaults.doubleForKey("default_tip_percentage")), animated: false)
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
