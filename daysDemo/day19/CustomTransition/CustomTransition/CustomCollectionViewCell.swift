//
//  CustomCollectionViewCell.swift
//  CustomTransition
//
//  Created by admin on 2022/8/14.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func configCell(model: CustomCollectionViewCellModel) {
        imageView = UIImageView(frame: self.bounds)
        imageView.image = model.image
        self.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
