//
//  ViewController.swift
//  Tippy
//
//  Created by Jeff Wang on 12/29/15.
//  Copyright © 2015 patwang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    @IBOutlet weak var billValue: UILabel!
    @IBOutlet weak var totsLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var billField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
          self.title = "Tippy"
        billValue.text = "  $0.00"
        billLabel.text = "+ $0.00"
        totsLabel.text = "$0.00"
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


    @IBAction func onEditingChanged(sender: AnyObject) {
        var tipPercent=[0.18,0.2,0.22]
        var tipP = tipPercent[tipControl.selectedSegmentIndex]
        
        var billamount = NSString(string: billField.text!).doubleValue
        var tip = billamount*tipP
        var total = billamount + tip
  
        billValue.text = String(format: "$%.2f", billamount)
        billLabel.text = String(format: "+ $%.2f", tip)
        totsLabel.text = String(format: "$%.2f", total)
       
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //print("view will appear")
        // This is a good place to retrieve the default tip percentage from NSUserDefaults
        // and use it to update the tip amount
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
        var tipPercent=[0.18,0.2,0.22]
        var tipP = tipPercent[tipControl.selectedSegmentIndex]
        
        var billamount = NSString(string: billField.text!).doubleValue
        var tip = billamount*tipP
        var total = billamount + tip
        
        
        billLabel.text = String(format: "+ $%.2f", tip)
        totsLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
      //  print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
       // print("view did disappear")
    }
}

