//
//  GSBarButtonItem.swift
//  ProjectOne
//
//  Created by Gantulga ts on 11/1/15.
//  Copyright © 2015 Gantulga ts. All rights reserved.
//

import UIKit

class GSBarButtonItem: UIView {
    var imageView:UIImageView = UIImageView();
    var titleLabel:UILabel = UILabel();
    
    init(frame: CGRect, title:String,imageName:String) {
        super.init(frame: frame);
        imageView.frame = CGRectMake((self.bounds.size.width-28)/2, 0, 28, 26);
        imageView.image = UIImage(named: imageName)
        imageView.highlightedImage = UIImage(named: imageName + "_active")
        self.addSubview(imageView)
        
        titleLabel.frame = CGRectMake(0,26,self.bounds.size.width,14)
        titleLabel.text = title
        titleLabel.font = UIFont.boldSystemFontOfSize(12)
        titleLabel.textAlignment = .Center
        titleLabel.highlightedTextColor = UIColor.blackColor()
        titleLabel.textColor = UIColor(red: 194.0/255.0, green: 194.0/255.0, blue: 194.0/255.0, alpha: 1.0)
        self.addSubview(titleLabel)
//        self.layer.borderWidth = 1;
    }
    func setHighligthed (highlight:Bool) {
        self.imageView.highlighted = highlight;
        self.titleLabel.highlighted = highlight;
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
