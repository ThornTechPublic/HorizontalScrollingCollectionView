//
//  DetailPage.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 11/13/15.
//  Copyright © 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class DetailPage: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var displayString = ""
    
    override func viewDidLoad() {
        displayLabel?.text = displayString
    }
    
}
