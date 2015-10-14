//
//  CFPagesVC+CollectionView.swift
//  CFPagesVC
//
//  Created by 成林 on 15/7/22.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

extension CFPagesVC: UICollectionViewDataSource,UICollectionViewDelegate{
    
    var cellID: String{return "CFPageCell"}
    
    var navH: CGFloat?{
        
        let navVC = self.navigationController
        
        if navVC == nil {return nil}
        
        if navVC!.navigationBarHidden {return nil}
        
        return self.navigationController?.navigationBar.bounds.size.height
    }
    
    /**  处理collectionView  */
    func collectionViewPrepare(){
        
        self.edgesForExtendedLayout = UIRectEdge.None
        
        //注册cell
        self.collectionView.registerNib(UINib(nibName: cellID, bundle: nil), forCellWithReuseIdentifier: cellID)
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if self.collectionView.tag == 1 {return}
        
    
        //设置布局
        let layout = CFLayout()
        let size = self.view.bounds.size
        let width = size.width
        var height = size.height
     
        
//        if navH != nil {height = height-(navH!+20)}
        
        height -= self.mustConfigModel.barViewH
        
        layout.itemSize = CGSizeMake(width, height)
        
        self.collectionView.collectionViewLayout = layout
        self.collectionView.tag == 1
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pageDataModels.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //直接取出重用cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! CFPageCell
        
        //传递数据
        cell.pageModel = self.pageDataModels[indexPath.item]
    
        return cell
    }

    
    
    

    
}
