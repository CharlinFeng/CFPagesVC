//
//  BarItemBtn.swift
//  CFPagesVC
//
//  Created by 成林 on 15/7/23.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation
import UIKit

class BarItemBtn: UIButton {
    
    var btnBasedTextWidth: CGFloat {return (self.currentTitle as! NSString).sizeWithAttributes([NSFontAttributeName: self.titleLabel!.font]).width}
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        /**  视图准备  */
        viewPrepare()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        /**  视图准备  */
        viewPrepare()
    }
}


extension BarItemBtn{
    
    /**  视图准备  */
    func viewPrepare(){
        
        self.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        self.setTitleColor(UIColor.redColor(), forState:[UIControlState.Highlighted, UIControlState.Selected])
        self.setTitleColor(UIColor.redColor(), forState:UIControlState.Selected)
      
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.brownColor().CGColor
        self.adjustsImageWhenHighlighted = false
    }
    
    
}