//
//  HeaderCell.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 11/2/15.
//  Copyright © 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class HeaderCell : UITableViewCell {

    @IBOutlet weak var headerLabel: UILabel!
    
    var name = "" {
        didSet {
            headerLabel.text = name
        }
    }
    
}
