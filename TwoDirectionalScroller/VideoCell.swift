//
//  VideoCell.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 7/11/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit
import AlamofireImage

class VideoCell : UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    var movie:Movie? = nil {
        didSet {
            if let movie = movie,
                let url = NSURL(string: movie.imageURL) {
                self.imageView.af_setImageWithURL(url)
            }
        }
    }
}
