//
//  VideoCell.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 7/11/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class VideoCell : UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var placeholderLabel: UILabel!
    var cellNumber:String? = nil {
        didSet {
            if let cellNumber = cellNumber {
                placeholderLabel?.text = cellNumber
            }
        }
    }
    
}
