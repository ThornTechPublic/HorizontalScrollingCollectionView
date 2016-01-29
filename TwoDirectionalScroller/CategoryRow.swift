//
//  CategoryRow.swift
//  TwoDirectionalScroller
//
//  Created by Robert Chen on 7/11/15.
//  Copyright (c) 2015 Thorn Technologies. All rights reserved.
//

import UIKit

class CategoryRow : UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var genre:Genre? = nil {
        didSet {
            collectionView.reloadData()
        }
    }
}

extension CategoryRow : UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genre!.movies.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("videoCell", forIndexPath: indexPath) as! VideoCell
        if let genre = genre {
            cell.movie = genre.movies[indexPath.row]
        }
        return cell
    }
    
}

extension CategoryRow : UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 4
        let hardCodedPadding:CGFloat = 5
        let itemHeight = collectionView.bounds.height - (2 * hardCodedPadding)
        let itemWidth = itemHeight * 300 / 444
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
}