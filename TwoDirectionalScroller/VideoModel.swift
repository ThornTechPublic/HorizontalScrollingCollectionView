//
//  VideoModel.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 1/4/16.
//  Copyright © 2016 Thorn Technologies. All rights reserved.
//

import Foundation

struct VideoModel {    
    static let sharedInstance = VideoModel()
    let categories:[Category]
    
    init(){
        // action
        let rambo = Video(name: "Rambo", imageURL: "")
        let dieHard = Video(name: "Die Hard", imageURL: "")
        let avengers = Video(name: "Avengers", imageURL: "")
        let bourneIdentity = Video(name: "Bourne Identity", imageURL: "")
        let action = Category(name: "Action", videos: [rambo, dieHard, avengers, bourneIdentity])
        // drama
        let forrestGump = Video(name: "Forrest Gump", imageURL: "")
        let shawshank = Video(name: "Shawshank Redemption", imageURL: "")
        let titanic = Video(name: "Titanic", imageURL: "")
        let drama = Category(name: "Drama", videos: [forrestGump, shawshank, titanic])
        // Science Fiction
        let matrix = Video(name: "Matrix", imageURL: "")
        let terminator = Video(name: "Terminator", imageURL: "")
        let scienceFiction = Category(name: "Science Fiction", videos: [matrix, terminator])
        // Kids
        let insideOut = Video(name: "Inside Out", imageURL: "")
        let toyStory = Video(name: "Toy Story", imageURL: "")
        let up = Video(name: "Up", imageURL: "")
        let findingNemo = Video(name: "Finding Nemo", imageURL: "")
        let kids = Category(name: "Kids", videos: [insideOut, toyStory, up, findingNemo])

        categories = [action, drama, scienceFiction, kids]
    }
    
}

struct Video {
    let name:String
    let imageURL:String
}

struct Category {
    let name:String
    let videos:[Video]
}