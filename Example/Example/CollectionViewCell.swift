//
//  CollectionViewCell.swift
//  Example
//
//  Created by Min Kim on 2/11/17.
//  Copyright © 2017 Min Kim. All rights reserved.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    class var reuseIdentifier: String {
        return "\(type(of: self))ReuseIdentifier"
    }

    let titleLabel: UILabel = .init()

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: "Courier-Bold", size: 14)

        contentView.addSubview(titleLabel)

        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1 / UIScreen.main.scale
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.frame = contentView.bounds
    }
}
