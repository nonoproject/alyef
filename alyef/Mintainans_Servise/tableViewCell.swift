//
//  ProductsCollectionViewCell.swift
//  CaffeBordga
//
//  Created by MAC on 22/01/2019.
//  Copyright © 2019 MAC. All rights reserved.
//

import UIKit

class tableViewCell: UITableViewCell {
    @IBOutlet weak var mainImage:UIImageView!
    @IBOutlet weak var productName:UILabel!
    @IBOutlet weak var ProductPrice: UILabel!
    @IBOutlet weak var location: UILabel!
    
    override func layoutSubviews() {
        self.layoutIfNeeded()
        styleSetup()
    }
    
    override func prepareForReuse() {
        
        mainImage.image = nil
        productName.text = nil
        ProductPrice.text = nil
         location.text = nil
       
    }
    override var bounds: CGRect {
        didSet {
            contentView.frame = bounds
        }
    }
    
}
// MARK: - Setup
extension tableViewCell {
    func styleSetup() {
        
    }
}
