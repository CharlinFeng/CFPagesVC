//
//  UIView+Extend.swift
//  CFPagesVC
//
//  Created by 成林 on 15/7/22.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func removeAllChildenView(){
        
        if self.subviews.count == 0 {return}
        
        for (_,subView) in self.subviews.enumerate(){
            subView.removeFromSuperview()
        }
    }
}