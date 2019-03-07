//
//  ServiceListCell.swift
//  alyef
//
//  Created by iMac on 2019/03/06.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit

class ServiceListCell:  UICollectionViewCell {
    @IBOutlet weak var main_image: UIImageView!
    
    @IBOutlet weak var offer_price: UILabel!
    @IBOutlet weak var original_price: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var titel: UILabel!
    @IBOutlet weak var offerImage: UIImageView!
    @IBOutlet weak var unitPrice: UILabel!
    override func awakeFromNib() {
    super.awakeFromNib()
    
    styleSetup()
    }
    
    override func prepareForReuse() {
    
    main_image.image = nil
    offer_price.text = nil
    original_price.text = nil
    price.text = nil
    titel.text = nil
    offerImage.image = nil
    unitPrice.text = nil
    }
    
    
    }
    
    // MARK: - Setup
    extension ServiceListCell {
        
        func styleSetup() {
            main_image.layer.borderWidth = 0.5
            main_image.layer.borderColor = UIColor.lightGray.cgColor
            offerImage.layer.borderWidth = 0.5
            offerImage.layer.borderColor = UIColor.lightGray.cgColor
        }
        
}
