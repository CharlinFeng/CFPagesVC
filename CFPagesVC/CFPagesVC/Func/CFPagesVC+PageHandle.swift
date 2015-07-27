//
//  CFPagesVC+PageHandle.swift
//  CFPagesVC
//
//  Created by 成林 on 15/7/27.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation
import UIKit

extension CFPagesVC{
    
    /**  页面处理  */
    func pageHandlePrepare(){
        
        barView.clickMeauItemClosure = {[unowned self] (btn,page) -> Void in
        
            if self.collectionView.dragging {return}
            
            self.collectionView.setContentOffset(CGPointMake(self.collectionView.bounds.size.width * CGFloat(page), 0), animated: true)
        
        }
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if !scrollView.dragging {return}
        
        let page = Int(scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5)
        
        barView.currentPage = page
    }
    
    
    
    
}