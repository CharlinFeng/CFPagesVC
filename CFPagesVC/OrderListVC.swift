//
//  OrderListVC.swift
//  CFPagesVC
//
//  Created by 成林 on 15/7/22.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

class OrderListVC: UIViewController {

    
    var index: Int!
    
    
    @IBOutlet weak var label: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "第\(index)页"

        print("第\(index)页 - viewDidLoad")
        
        self.title = "这是导航栏"
        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        print("第\(index)页 - viewWillAppear")
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        print("第\(index)页 - viewDidAppear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("第\(index)页 - viewWillDisappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        
        print("第\(index)页 - viewDidDisappear")
    }

    
    

}
