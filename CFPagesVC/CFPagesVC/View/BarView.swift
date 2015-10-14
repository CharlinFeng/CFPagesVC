//
//  BarView.swift
//  CFPagesVC
//
//  Created by 成林 on 15/7/23.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import Foundation
import UIKit

class BarView: UIView {
    
    let lineH: CGFloat = 2
    
    var pageModels: [CFPagesVC.PagesDataModel]!{didSet{meauPrepare()}}
    
    var configModel: CFPagesVC.PagesConfigModel!
    
    lazy var lineView: UIView = {UIView()}()
    
    lazy var btns: [BarItemBtn] = []
    
    lazy var scrollView: UIScrollView = {UIScrollView()}()
    
    var selectedBtn: BarItemBtn!{ willSet{selectedMeauItemBtn(selectedBtn, newBtn: newValue)}}
    
    var currentPage: Int = 0 {didSet{updatePage(currentPage)}}
    
    lazy var scrollViewMaxX: CGFloat = {self.scrollView.contentSize.width - self.scrollView.frame.size.width}()
    
    var clickMeauItemClosure: ((itemBtn: BarItemBtn, page: Int) -> Void)!
}





extension BarView{
    

    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.addSubview(scrollView)
        
        scrollView.layer.borderWidth = 1
        
        lineView.backgroundColor = UIColor.redColor()
        scrollView.addSubview(lineView)
        scrollView.showsHorizontalScrollIndicator = false
    }
    
    
    /**  准备菜单列表  */
    func meauPrepare(){
        
        if pageModels==nil || pageModels.count == 0 {return}
        
        for (index, pageModel) in pageModels.enumerate(){
            
            //创建
            let barItemBtn = BarItemBtn()
            
            //设置文字
            barItemBtn.setTitle(pageModel.desc, forState: UIControlState.Normal)
            
            //设置tag
            barItemBtn.tag = index
            
            /**  菜单点击事件  */
            barItemBtn.addTarget(self, action: "btnClick:", forControlEvents: UIControlEvents.TouchDown)

            //添加
            self.scrollView.addSubview(barItemBtn)
            
            //记录
            btns.append(barItemBtn)
            
            //默认选中
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
                Int64(0.5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
                    
                    if index == 0 {self.selectedBtn = barItemBtn}
            }
        }
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
    }
    
    /**  菜单点击事件  */
    func btnClick(btn: BarItemBtn){
        
        if self.selectedBtn === btn {return}
        
        self.selectedBtn = btn
        
        /**  调整偏移  */
        scrollViewAdjustContentOffset(btn)
    }
    
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        if configModel == nil {return}
        
        let height = self.bounds.size.height
        
        let y: CGFloat = 0
        
        //确定scrollView在大小
        self.scrollView.frame = self.bounds
        
        //遍历
        for (i, btn) in self.btns.enumerate(){
            
            let width = configModel.useStaticWidth ? configModel.staticWidth : btn.btnBasedTextWidth + configModel.btnExtraWidth
            
            let x = i == 0 ? 0 + configModel.leftInset : CGRectGetMaxX(self.btns[i - 1].frame) + configModel.btnExtraWidth
            
            btn.frame = CGRectMake(x, y, width, height)
        }
        
        //确定scrollView的contentSize
        self.scrollView.contentSize = CGSizeMake(CGRectGetMaxX(self.btns.last!.frame) + configModel.rightInset, height)
        lineView.frame = CGRectMake(0, height - lineH, 0, lineH)
    }
    
    /**  选中菜单按钮  */
    func selectedMeauItemBtn(oldBtn: BarItemBtn!, newBtn: BarItemBtn!){
        
        if oldBtn != nil {oldBtn.selected = false}
        if newBtn != nil {newBtn.selected = true}
        
        //更新lineView的frame
        let x = CGRectGetMinX(newBtn.frame)
        let y = self.bounds.size.height - lineH - 2
        let width = newBtn.frame.size.width
        let height: CGFloat = lineH
        self.lineView.layer.removeAllAnimations()
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 120, initialSpringVelocity: 15, options: UIViewAnimationOptions.CurveEaseInOut, animations: {[unowned self] () -> Void in
            self.lineView.frame = CGRectMake(x, y, width, height)
        }, completion: nil)
        
        let page = newBtn.tag
        
        clickMeauItemClosure?(itemBtn: newBtn,page: page)
    }
    

    /**  更新页码  */
    func updatePage(currentPage: Int){
        
        if currentPage >= self.pageModels.count {return}
        let currentBtn = btns[currentPage]
        self.btnClick(currentBtn)
        
        
        /**  调整偏移  */
        scrollViewAdjustContentOffset(currentBtn)
    }
    
    /**  调整偏移  */
    func scrollViewAdjustContentOffset(currentBtn: BarItemBtn){
        
        //更新scrollView的contentView
        let width = scrollView.bounds.size.width
        var x = currentBtn.frame.origin.x + (currentBtn.frame.size.width - width)*0.5
        
        if x<=0 {x=0}
        
        if x>=scrollViewMaxX {x = scrollViewMaxX}
        
        UIView.animateWithDuration(0.5, animations: {[unowned self] () -> Void in
            self.scrollView.contentOffset = CGPointMake(x, 0)
            })
    }

}
