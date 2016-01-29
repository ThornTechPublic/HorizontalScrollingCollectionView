//
//  Movie.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 1/29/16.
//  Copyright © 2016 Thorn Technologies. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Movie {
    var name:String
    var imageURL:String
    var movieDescription:String
    
    func updateImageURL(){
        let parameters:[String: AnyObject] = [
            "t": name,
            "y": "",
            "plot": "short",
            "r": "json"
        ]
        let omdbAPI = "https://www.omdbapi.com/"
        let URL = NSURL(string: omdbAPI)!
        let URLRequest = NSMutableURLRequest(URL: URL)
        URLRequest.HTTPMethod = "GET"
        request(ParameterEncoding.URL.encode(URLRequest, parameters: parameters).0)
            .responseJSON() { response in
                guard let dataValue = response.result.value else { return }
                let json = JSON(dataValue)
                self.imageURL = json["Poster"].stringValue
                self.name = json["Title"].stringValue
                self.movieDescription = json["Plot"].stringValue
            }
    }

    // Created model without imageURL, so need to fetch it.
    init(name: String){
        self.name = name
        self.imageURL = ""
        self.movieDescription = ""
        updateImageURL()
    }
    
    // Supplying imageURL, so assuming a valid URL is supplied.
    init(name: String, imageURL: String, movieDescription: String){
        self.name = name
        self.imageURL = imageURL
        self.movieDescription = movieDescription
    }
}
