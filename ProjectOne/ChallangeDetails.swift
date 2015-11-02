//
//  ChallageDetails.swift
//  ProjectOne
//
//  Created by Gansoronzon on 11/1/15.
//  Copyright © 2015 Gantulga ts. All rights reserved.
//

import UIKit

let windowFrame = UIScreen.mainScreen().bounds

class ChallangeDetails: UIViewController {
    
    // MARK: Vars
    
    private var collectionViewLayout: LGHorizontalLinearFlowLayout!
    private var dataSource: Array<String>!
    
    @IBOutlet private var collectionView: UICollectionView!
    
    private var animationsCount = 0
    
    private var pageWidth: CGFloat {
        return self.collectionViewLayout.itemSize.width + self.collectionViewLayout.minimumLineSpacing
    }
    
    private var contentOffset: CGFloat {
        return self.collectionView.contentOffset.x + self.collectionView.contentInset.left
    }
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureDataSource()
        self.configureCollectionView()
    }
    
    // MARK: Configuration
    
    private func configureDataSource() {
        self.dataSource = Array()
        for index in 1...10 {
            self.dataSource.append("Page \(index)")
        }
    }
    
    private func configureCollectionView() {
        self.collectionView.registerNib(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        self.collectionViewLayout = LGHorizontalLinearFlowLayout.configureLayout(collectionView: self.collectionView, itemSize: CGSizeMake(windowFrame.width - 100, windowFrame.height - 100), minimumLineSpacing: 0)
    }
    
    private func scrollToPage(page: Int, animated: Bool) {
        self.collectionView.userInteractionEnabled = false
        self.animationsCount++
        let pageOffset = CGFloat(page) * self.pageWidth - self.collectionView.contentInset.left
        self.collectionView.setContentOffset(CGPointMake(pageOffset, 0), animated: true)
    }
}

extension ChallangeDetails: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let collectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
//        collectionViewCell.pageLabel.text = self.dataSource[indexPath.row]
        return collectionViewCell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if collectionView.dragging || collectionView.decelerating || collectionView.tracking {
            return
        }
        
        let selectedPage = indexPath.row
        
        self.scrollToPage(selectedPage, animated: true)
    }

    
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        if --self.animationsCount == 0 {
            self.collectionView.userInteractionEnabled = true
        }
    }
    
}

