//
//  CFPagesVC.swift
//  CFPagesVC
//
//  Created by 成林 on 15/7/22.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit



class CFPagesVC: UIViewController {
    
    @IBOutlet private weak var barViewHC: NSLayoutConstraint!
    @IBOutlet weak var barView: BarView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pageDataModels: [PagesDataModel]!{didSet{vcPrepare()}}
    var pageConfigModel: PagesConfigModel!
    lazy var defaultPageConfigModel: PagesConfigModel = {PagesConfigModel(useAutoWidthWithBarViewH: 44, leftInset: 40, rightInset: 40, btnExtraWidth:60)}()
    lazy var mustConfigModel: PagesConfigModel = {self.pageConfigModel ?? self.defaultPageConfigModel}()
    
    /**  代码设置页码  */
    func jumpToPage(page: Int){barView.currentPage = page} 
}


extension CFPagesVC{
    
    /**  初始化  */
    class func getInstance() -> CFPagesVC{
        return CFPagesVC(nibName: "CFPagesVC", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /**  处理collectionView  */
        collectionViewPrepare()
        
        /**  处理barViewH  */
        barViewHandle()
        
        /**  页面处理  */
        pageHandlePrepare()
    }
    
    /**  完善处理  */
    func vcPrepare(){
        
        if pageDataModels == nil || pageDataModels.count == 0 {return}
        
        for (_,pageDataModel) in pageDataModels.enumerate(){
            self.addChildViewController(pageDataModel.pageVC)
        }
    }
    
    /**  处理barView  */
    func barViewHandle(){
        
        self.barViewHC.constant = mustConfigModel.barViewH
        self.barView.configModel = self.mustConfigModel
        self.barView.pageModels = self.pageDataModels
    }
}
