//
//  RouterService.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 1/29/16.
//  Copyright © 2016 Thorn Technologies. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RouterService : NSObject {
    
    static let sharedInstance = RouterService()
    
    static let omdbAPI = "https://www.omdbapi.com/"
    
    func fetchMovie(title: String, callback: (Bool, Movie?) -> Void) {
        let parameters:[String: AnyObject] = [
            "t": title,
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
                guard let dataValue = response.result.value else {
                    callback( false, nil )
                    return
                }
                let json = JSON(dataValue)
                let imageURL = json["Poster"].stringValue
                let title = json["Title"].stringValue
                let movieDescription = json["Plot"].stringValue
                let movie = Movie(name: title, imageURL: imageURL, movieDescription: movieDescription)
                callback( true, movie )
            }
    }
}