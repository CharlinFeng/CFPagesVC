//
//  AppDelegate.swift
//  CFPagesVC
//
//  Created by 成林 on 15/7/22.
//  Copyright (c) 2015年 冯成林. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var pagesVC: UIViewController {return self.pageVC()}
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        //请依次注销查看
    
        /**  无导航控制器，无tab控制器  */
//        no_NavVC_no_TabVC()
        
        /**  有导航无tab  */
//        has_NavVC_no_TabVC()
        
        /**  无导航有tab  */
//        no_NavVC_has_TabVC()
        
        /**  有导航有tab  */
        has_NavVC_has_TabVC()
        
        self.window?.makeKeyAndVisible()
        
        
        return true
    }
    
    /**  无导航控制器，无tab控制器  */
    func no_NavVC_no_TabVC(){
        self.window?.rootViewController = pageVC()
    }
    
    /**  有导航无tab  */
    func has_NavVC_no_TabVC(){
        let navVC = UINavigationController(rootViewController: pageVC())
        self.window?.rootViewController = navVC
    }
    
    /**  无导航有tab  */
    func no_NavVC_has_TabVC(){
        
        let tabVC  = UITabBarController()
        tabVC.viewControllers = [pageVC()]
        self.window?.rootViewController = tabVC
    }
    
    /**  有导航有tab  */
    func has_NavVC_has_TabVC(){
        let navVC = UINavigationController(rootViewController: pageVC())
        navVC.tabBarItem.title = "这是TabBar"
        let tabVC  = UITabBarController()
        tabVC.viewControllers = [navVC]
        self.window?.rootViewController = tabVC
    }
    
    
    
    
    func pageVC() ->UIViewController{
        
        let pagesVC = CFPagesVC(nibName: "CFPagesVC", bundle: nil)
        
        /**  数据模型  */
        var pageDataModels: [CFPagesVC.PagesDataModel] = []
        
        var titles: [String] = ["已下单","订单","这个是用户的历史订单","库存信息","Massage","所有的订单信息"]
        
        for i in 0..<6{
            
            let orderVC = OrderListVC(nibName: "OrderListVC", bundle: nil)
            
            orderVC.index = i
            
            let pm = CFPagesVC.PagesDataModel(pageVC: orderVC, desc: titles[i])
            
            pageDataModels.append(pm)
        }
        
        pagesVC.pageDataModels = pageDataModels
    
        /**  配置模型  */
//        let configModel = CFPagesVC.PagesConfigModel(useStaticWidthWithBarViewH: 60, leftInset: 40, rightInset: 80, staticWidth: 100)
//        pagesVC.pageConfigModel = configModel
        
        pagesVC.title = "这是导航栏"
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW,
            Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue()) { () -> Void in
                
                pagesVC.jumpToPage(3)
        }
        
        return pagesVC
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

