//
//  CFPagesModel.swift
//  CFPagesVC
//
//  Created by 成林 on 15/7/22.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

extension CFPagesVC{
    
    
    /**  数据模型  */
    class PagesDataModel {
        
        let pageVC: UIViewController
        let desc: String
        
        init(pageVC: UIViewController, desc: String){
            
            self.pageVC = pageVC
            self.desc = desc
        }
    }
    
    /**  配置模型  */
    class PagesConfigModel {
    
        /**  条的高度  */
        let barViewH: CGFloat
        
        /**  顶部区域scrollView滚动范围额外增加的左边距和右边距  */
        let leftInset: CGFloat
        let rightInset: CGFloat
        

        
        /**  是否使用指定的宽度：指定宽度下，所有菜单项宽度均一致  */
        let useStaticWidth: Bool
        
        
        /**  1.指定宽度  */
        let staticWidth: CGFloat
        
        
        /**  2.自动宽度  */
        /**  按钮额外的宽度扩展值  */
        let btnExtraWidth: CGFloat
        
        /**  自动宽度  */
        init(useAutoWidthWithBarViewH barViewH: CGFloat,leftInset: CGFloat,rightInset: CGFloat, btnExtraWidth: CGFloat){
            
            self.barViewH = barViewH
            self.leftInset = leftInset
            self.rightInset = rightInset
            self.useStaticWidth = false
            self.staticWidth = 0
            self.btnExtraWidth = btnExtraWidth
        }
        
        /**  指定宽度  */
        init(useStaticWidthWithBarViewH barViewH: CGFloat,leftInset: CGFloat,rightInset: CGFloat, staticWidth: CGFloat){
            
            self.barViewH = barViewH
            self.leftInset = leftInset
            self.rightInset = rightInset
            self.useStaticWidth = true
            self.staticWidth = staticWidth
            self.btnExtraWidth = 0
        }
        
        
        
        
    }
    
    
}



