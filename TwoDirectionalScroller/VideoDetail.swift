//
//  VideoDetail.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 1/29/16.
//  Copyright © 2016 Thorn Technologies. All rights reserved.
//

import UIKit
import AlamofireImage

class VideoDetail : UIViewController {
    var movie:Movie? = nil
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDescription: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        if let movie = movie {
            movieName.text = movie.name
            movieDescription.text = movie.movieDescription
            if let url = NSURL(string: movie.imageURL) {
                self.imageView.af_setImageWithURL(url)
            }
        }
    }
}
