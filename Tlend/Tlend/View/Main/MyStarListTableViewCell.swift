//
//  MyStarListTableViewCell.swift
//  Tlend
//
//  Created by 이혜진 on 2018. 11. 16..
//  Copyright © 2018년 LeeHyeJin. All rights reserved.
//

import UIKit

class MyStarListTableViewCell: UITableViewCell {

    @IBOutlet weak var myStarListCollectionView: UICollectionView!
    
    struct Style {
        static let widthRatio: CGFloat = UIScreen.main.bounds.width/375
        
        static let cellSize: CGSize = CGSize(width: 105*Style.widthRatio, height: 130*Style.widthRatio)
        static let cellEdgeInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 18*Style.widthRatio, bottom: 0, right: 18*Style.widthRatio)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionViewinit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension MyStarListTableViewCell: UICollectionViewDelegate {
    private func collectionViewinit() {
        self.myStarListCollectionView.delegate = self; self.myStarListCollectionView.dataSource = self
        
        self.myStarListCollectionView.register(MyStarImageCollectionViewCell.self)
    }
}

extension MyStarListTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(MyStarImageCollectionViewCell.self, for: indexPath)
        return cell
    }
}

extension MyStarListTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Style.cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Style.cellEdgeInset
    }
}
