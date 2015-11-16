//
//  VideoCell.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 7/11/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit
import Alamofire

class VideoCell : UICollectionViewCell {
    
    var currentImageRequest:Request? = nil

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    var movie:Movie? = nil {
        didSet {
            if let movie = movie {
                    
                name.text = movie.name
                
                currentImageRequest = request(.GET, movie.urlString)
                    .responseImage() { _, _, result in
                        dispatch_async(dispatch_get_main_queue()) {
                            guard let image = result.value else {
                                return
                            }
                            self.storeLogo.image = image
                        }
                    }

            }

        }
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        if let currentImageRequest = currentImageRequest {
            currentImageRequest.cancel()
        }
    }
}
