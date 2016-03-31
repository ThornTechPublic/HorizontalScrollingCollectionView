//
//  Catalog.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 1/29/16.
//  Copyright © 2016 Thorn Technologies. All rights reserved.
//

import Foundation

class Catalog {
    static let sharedInstance = Catalog()
    let genres:[Genre]

    init(){
        // action
        let rambo = Movie(name: "Rambo")
        let dieHard = Movie(name: "Die Hard")
        let avengers = Movie(name: "The Avengers")
        let bourneIdentity = Movie(name: "Bourne Identity")
        let action = Genre(name: "Phim Đang Hot", movies: [rambo, dieHard, avengers, bourneIdentity])
        // drama
        let forrestGump = Movie(name: "Forrest Gump")
        let shawshank = Movie(name: "Shawshank Redemption")
        let titanic = Movie(name: "Titanic")
        let drama = Genre(name: "Phim Lẻ", movies: [forrestGump, shawshank, titanic])
        // Science Fiction
        let matrix = Movie(name: "The Matrix")
        let terminator = Movie(name: "The Terminator")
        let scienceFiction = Genre(name: "Phim Bộ", movies: [matrix, terminator])
        // Kids
        let insideOut = Movie(name: "Inside Out")
        let toyStory = Movie(name: "Toy Story")
        let up = Movie(name: "Up")
        let findingNemo = Movie(name: "Finding Nemo")
        let kids = Genre(name: "Phim Hài", movies: [insideOut, toyStory, up, findingNemo])
        
        genres = [action, drama, scienceFiction, kids]

    }
}