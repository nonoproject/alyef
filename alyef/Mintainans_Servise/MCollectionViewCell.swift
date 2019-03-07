//
//  MCollectionViewCell.swift
//  alyef
//
//  Created by iMac on 2019/03/06.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit

class MCollectionViewCell: UICollectionViewCell {
    
        @IBOutlet weak var label: UILabel!
    //
    //
        @IBOutlet weak var Image: UIImageView!
        override func awakeFromNib() {
            super.awakeFromNib()
    
            styleSetup()
        }
    
        override func prepareForReuse() {
    
            label.text = nil
            Image.image = nil
    
        }
    
    
}

// MARK: - Setup
extension MCollectionViewCell {
    
    func styleSetup() {
                Image.layer.borderWidth = 0.5
                Image.layer.borderColor = UIColor.lightGray.cgColor
    }
}
