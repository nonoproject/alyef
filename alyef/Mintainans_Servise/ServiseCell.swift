//
//  ServiseCell.swift
//  alyef
//
//  Created by iMac on 2019/03/06.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit

class ServiseCell: UITableViewCell {

    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var chang_status: UIButton!
    
    override func layoutSubviews() {
        self.layoutIfNeeded()
        styleSetup()
    }
    override func prepareForReuse() {
        
        status.text = nil
        
        chang_status.backgroundColor = nil
    }
    override var bounds: CGRect {
        didSet {
            contentView.frame = bounds
        }
    }
    
}
// MARK: - Setup
extension ServiseCell {
    func styleSetup() {
        
    }
}


