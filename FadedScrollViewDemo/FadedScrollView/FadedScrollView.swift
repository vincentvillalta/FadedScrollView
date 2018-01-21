//
//  FadedScrollView.swift
//  FadedScrollViewDemo
//
//  Created by Vincent Villalta on 1/21/18.
//  Copyright © 2018 Vincent Villalta. All rights reserved.
//

import UIKit
@IBDesignable
open class FadedScrollView: UIScrollView {
    @IBInspectable public var fadeTop: Bool = true {
        didSet {
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    @IBInspectable public var fadeBottom: Bool = true {
        didSet {
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    @IBInspectable public var fadeSize: CGFloat = 50.0 {
        didSet {
            self.setNeedsLayout()
            self.layoutIfNeeded()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        fadeTop = true
        fadeBottom = true
        fadeSize = 50.0
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        fadeTop = true
        fadeBottom = true
        fadeSize = 50.0
    }
    
    override open func layoutSubviews() {
        if self.fadeBottom || self.fadeBottom {
            let maskLayer = CALayer()
            maskLayer.frame = self.bounds
            
            let solidLayer = CALayer()
            solidLayer.backgroundColor = UIColor.black.cgColor
            var solidRect = CGRect.zero
            solidRect.origin.x = self.contentOffset.x
            solidRect.size = self.bounds.size
            if self.fadeTop {
                solidRect.origin.y = fadeSize
            }
            if self.fadeBottom {
                solidRect.size.height = solidRect.size.height-(solidRect.origin.y + fadeSize)
            }
            
            solidLayer.frame = solidRect
            maskLayer.addSublayer(solidLayer)
            
            if self.fadeTop {
                let topLayer = CAGradientLayer()
                topLayer.frame = CGRect(x: self.contentOffset.x, y: 0, width: self.bounds.width, height: fadeSize)
                topLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
                topLayer.startPoint = CGPoint.zero
                topLayer.endPoint = CGPoint(x: 0, y: 1)
                maskLayer.addSublayer(topLayer)
            }
            
            if self.fadeBottom {
                let bottomLayer = CAGradientLayer()
                bottomLayer.frame = CGRect(x: self.contentOffset.x, y: self.bounds.height - fadeSize, width: self.bounds.width, height: fadeSize)
                bottomLayer.colors = [UIColor.black.cgColor, UIColor.clear.cgColor]
                bottomLayer.startPoint = CGPoint.zero
                bottomLayer.endPoint = CGPoint(x: 0, y: 1)
                maskLayer.addSublayer(bottomLayer)
            }
            
            self.layer.mask = maskLayer
        } else {
            self.layer.mask = nil
        }
    }
    
}
