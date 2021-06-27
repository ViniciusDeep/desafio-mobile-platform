//
//  AdListViewLayout.swift
//  OUIKit
//
//  Created by Vinicius Mangueira Correa on 27/06/21.
//

import UIKit

public final class FlowListViewLayout: UICollectionViewFlowLayout {

    let cardCellHeight:CGFloat = 128.0

    public override init() {
        super.init()
        self.setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public override func prepare() {
        let height:CGFloat = cardCellHeight
        guard let collection = self.collectionView else { return }
        let width:CGFloat = collection.bounds.size.width - (self.sectionInset.left * 2)
        self.itemSize = CGSize(width: width, height: height)
    }

    private func setup() {
        self.minimumLineSpacing = 10.0
        self.minimumInteritemSpacing = 10.0
        self.sectionInset = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
    }

}

