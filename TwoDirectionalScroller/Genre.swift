//
//  Genre.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 1/29/16.
//  Copyright © 2016 Thorn Technologies. All rights reserved.
//

import Foundation

class Genre {
    let name:String
    let movies:[Movie]
    
    init(name: String, movies: [Movie]){
        self.name = name
        self.movies = movies 
    }
}