//
//  Loader.swift
//  alyef
//
//  Created by WEB on 3/13/19.
//  Copyright © 2019 awad. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

open class Loader:UIView {
    
    var activityIndicatorViewBackgrount:UIView = {
        var aivb = UIView()
        aivb.translatesAutoresizingMaskIntoConstraints = false
        aivb.isHidden = true
        aivb.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.7553242723)
        return aivb
    }()
    
    var activityIndicatorView:NVActivityIndicatorView!
    
    var loaderFrame:CGRect!
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    func setupLayout() {
        self.addSubview(activityIndicatorViewBackgrount)
        let cols = 4
        let rows = 8
        let cellWidth = Int(self.frame.width / CGFloat(cols))
        let cellHeight = Int(self.frame.height / CGFloat(rows))
        let frame = CGRect(x: 0, y: 0, width: cellWidth, height: cellHeight )
        activityIndicatorView = NVActivityIndicatorView(frame: frame,
                                                        type: .lineSpinFadeLoader)
        activityIndicatorView.padding = 20
        activityIndicatorView.color = #colorLiteral(red: 0.1294117647, green: 0.1843137255, blue: 0.2745098039, alpha: 1)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicatorViewBackgrount.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        activityIndicatorViewBackgrount.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        activityIndicatorViewBackgrount.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        activityIndicatorViewBackgrount.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.activityIndicatorViewBackgrount.addSubview(activityIndicatorView)
        activityIndicatorView.centerYAnchor.constraint(equalTo: self.activityIndicatorViewBackgrount.centerYAnchor).isActive = true
        activityIndicatorView.centerXAnchor.constraint(equalTo: self.activityIndicatorViewBackgrount.centerXAnchor).isActive = true
    }
    
    
    public func loaderStart() {
        activityIndicatorView.startAnimating()
        activityIndicatorViewBackgrount.isHidden = false
    }
    
    public func loaderStop() {
        activityIndicatorView.stopAnimating()
        activityIndicatorViewBackgrount.isHidden = true
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
