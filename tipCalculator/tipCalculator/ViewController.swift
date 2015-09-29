//
//  ViewController.swift
//  tipCalculator
//
//  Created by Jiayin Cheng on 9/26/15.
//  Copyright (c) 2015 Jiayin Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        tipResult.text = ""
        totalText.text = ""
        
        defaults.setInteger(0, forKey: TIP_KEY)
        tipSelector.selectedSegmentIndex = 0
        tipPercent = TIP_PERCENT[0]
    }
    
    override func viewDidAppear(animated: Bool) {
        setDefaults()
        calculate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    var defaults = NSUserDefaults.standardUserDefaults()
    var TIP_KEY = "TIP_SELECTOR_KEY"
    var TIP_PERCENT: [Double] = [10, 15, 18, 20]
    var tipSelectorSelectedIndex = 0
    var tipPercent: Double = 0
    
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var tipResult: UILabel!
    @IBOutlet weak var totalText: UILabel!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var customTip: UITextField!
    @IBOutlet weak var tipText: UILabel!
    
    // CustomTip percent change event.
    @IBAction func customTipChanged(sender: UITextField) {
        if (customTip.text != "") {
            tipPercent = getDouble(customTip.text)
            calculate()
        }
    }
    
    // Tip selector value change event.
    @IBAction func tipSelectorValueChanged(sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        tipPercent = TIP_PERCENT[index]
        calculate()
    }
    
    // Amount change event.
    @IBAction func numberChanged(sender: UITextField) {
        calculate()
    }
    
    func formatResult (value : Double) -> String {
        return String(format: "%.2f", value);
    }
    
    func formatTipText (tipValue: Double) -> String {
        var tipAmt = String(format: "%.2f", tipValue)
        if tipAmt.hasSuffix(".00") {
            tipAmt = String(format: "%.0f", tipValue)
        }
        return "(\(tipAmt)%)"
    }
    
    func getDouble(str : String!) -> Double {
        return NSNumberFormatter().numberFromString(str)!.doubleValue
    }
    
    func calculate() {
        if (amount.text! == "") {
            return
        }
        
        let amt = getDouble(amount.text)
        var tip = tipPercent * amt * 0.01
        var total = tip + amt
        
        tipText.text = formatTipText(tipPercent)
        tipResult.text = formatResult(tip)
        totalText.text = formatResult(total)
        
    }
    
    func setDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        var index = defaults.integerForKey(TIP_KEY)
        tipSelector.selectedSegmentIndex = index
        tipPercent = TIP_PERCENT[index]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if identifier == "showSettings" {
                println("change to see settings.")
            }
        }
    }
}

