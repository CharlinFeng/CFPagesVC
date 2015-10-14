//
//  CFLayout.swift
//  CFPagesVC
//
//  Created by 成林 on 15/7/22.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class CFLayout: UICollectionViewFlowLayout {
   
    override init(){
        super.init()
        
        /**  初始化设置  */
        cfLayoutPrepare()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**  初始化设置  */
    func cfLayoutPrepare(){
        
        //设置为水平滚动
        self.scrollDirection = UICollectionViewScrollDirection.Horizontal
        //无间距
        self.minimumLineSpacing = 0
        self.minimumInteritemSpacing = 0
        self.sectionInset = UIEdgeInsetsZero
    }
    
    
}
