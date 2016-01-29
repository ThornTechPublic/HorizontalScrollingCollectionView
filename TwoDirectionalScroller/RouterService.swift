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

    enum Router: URLRequestConvertible {
        
        // define Router calls and input parameter types
        case FetchMovie(params: [String: AnyObject])
        var URLRequest: NSMutableURLRequest {
            // generate HTTP verbs, URL paths, and parameters
            let (verb, path, parameters): (Alamofire.Method, String, [String: AnyObject]?) = {
                switch self {
                case .FetchMovie(let params):
                    return (.GET, omdbAPI, params)
                }
            }()
            let URL = NSURL(string: path)!
            let URLRequest = NSMutableURLRequest(URL: URL)
            URLRequest.HTTPMethod = verb.rawValue
            URLRequest.cachePolicy = .ReloadIgnoringLocalCacheData
            
            return ParameterEncoding.URL.encode(URLRequest, parameters: parameters).0
        }
    }
    
    func fetchMovie(title: String, callback: (Bool, Movie?) -> Void) {
        let parameters:[String: AnyObject] = [
            "t": title,
            "y": "",
            "plot": "short",
            "r": "json"
        ]
        request(Router.FetchMovie(params: parameters))
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