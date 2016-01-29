//
//  Movie.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 1/29/16.
//  Copyright © 2016 Thorn Technologies. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class Movie {
    var name:String
    var imageURL:String
    
    func updateImageURL(){
        RouterService.sharedInstance.fetchMovie(name) { success, movie in
            guard let movie = movie where success else {
                return
            }
            self.imageURL = movie.imageURL
            self.name = movie.name
        }
    }

    // Created model without imageURL, so need to fetch it.
    init(name: String){
        self.name = name
        self.imageURL = ""
        updateImageURL()
    }
    
    // Supplying imageURL, so assuming a valid URL is supplied.
    init(name: String, imageURL: String){
        self.name = name
        self.imageURL = imageURL
    }
}
