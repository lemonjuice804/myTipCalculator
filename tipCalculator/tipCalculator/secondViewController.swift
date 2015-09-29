//
//  secondViewController.swift
//  tipCalculator
//
//  Created by Jiayin Cheng on 9/28/15.
//  Copyright (c) 2015 Jiayin Cheng. All rights reserved.
//

import UIKit

class secondViewController : UIViewController {

    @IBOutlet weak var defaultDiscountSelector: UISegmentedControl!
    var TIP_KEY = "TIP_SELECTOR_KEY"
    @IBAction func changeDefaults(sender: UISegmentedControl) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(sender.selectedSegmentIndex, forKey: TIP_KEY)
    }

}
