//
//  CFPageCell.swift
//  CFPagesVC
//
//  Created by 成林 on 15/7/22.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class CFPageCell: UICollectionViewCell {

    var pageModel: CFPagesVC.PagesDataModel!{didSet{dataFill()}}
    
    private var pageVCView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.redColor().CGColor
    }
    
    /**  数据填充  */
    func dataFill(){
    
        if self.pageModel == nil {return}
        
        self.removeAllChildenView()
        
        pageVCView = pageModel.pageVC.view
        
        self.addSubview(pageVCView)
    }
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if self.pageModel == nil {return}
        
        pageVCView.frame = self.bounds
        
    }
    
}
