![image](./CFPagesVC/show.jpg)<br />
##### 中国.成都冯成林原创，请支持原创，谢谢            --- Charlin Feng

# CFPagesVC （持续关注[信息公告牌](https://github.com/CharlinFeng/Show)）
    Professional Multi controller management Framework based on Swift





<br /><br /><br />




Explain：
===============
Multi controller management based on CFPagesVC,Use CFPagesVC You can easily show your custom controller.
Here's another version of the OC that I wrote before.
CorePagesView: https://github.com/nsdictionary/CorePagesView.

The difference between these two versions is that CorePagesView is based on OC, the use of Scrollview is complete, while the CFPagesVC is based on Swift, and the clever use of CollectionView.

<br/><br/><br/>
Function display
===============
<br/>
#### No NavigationController, no TabbarController
![image](./CFPagesVC/show1.gif)<br />

<br/><br/>
#### Has NavigationController, no TabbarController
![image](./CFPagesVC/show2.gif)<br />

<br/><br/>
#### No NavigationController, has TabbarController
![image](./CFPagesVC/show3.gif)<br />

<br/><br/>
#### Has NavigationController, has TabbarController
![image](./CFPagesVC/show4.gif)<br />

<br/><br/>
#### More menu items need to be displayed and not to worry about it.
![image](./CFPagesVC/show5.gif)<br />

<br/><br/>
#### Dynamic calculation of menu length.
![image](./CFPagesVC/show6.gif)<br />

<br/><br/>
#### Code page jump control
![image](./CFPagesVC/show7.gif)<br />


Use
===============
<br/><br/>
#### 1.Obtain an instance
       
      let pagesVC = CFPagesVC.getInstance()


<br/><br/>
#### 2.Data using Closure transfer model

            var titles: [String] = ["已下单","订单","这个是用户的历史订单","库存信息","Massage","所有的订单信息"]
            
            for i in 0..<titles.count{
                
                let orderVC = OrderListVC(nibName: "OrderListVC", bundle: nil)
                
                orderVC.index = i
                
                let pm = CFPagesVC.PagesDataModel(pageVC: orderVC, desc: titles[i])
                
                pageDataModels.append(pm)
            }
            
            pagesVC.pageDataModels = pageDataModels


<br/><br/>
#### 3. Custom configuration
The default is fully automatic calculation, if you are willing, you can also configure, such as specifying the width and spacing, specify the spacing between the two sides of Scrollview, etc.

        /**  Custom configuration  */
        let configModel = CFPagesVC.PagesConfigModel(useStaticWidthWithBarViewH: 60, leftInset: 40, rightInset: 80, staticWidth: 100)
        pagesVC.pageConfigModel = configModel
        
<br/>
Here are two models for you to choose, one is based on the length of the text automatically calculate the length of the menu text, you can specify additional width. The other one is set wide, you can also add additional width.

<br/>
This class PagesConfigModel is in the CFPagesVC namespace, and he has these properties you can customize:<br />
>.barViewH --- Height of menu bar.<br />
>.leftInset --- The Scrollview menu's left inset.<br />
>.rightInset --- The Scrollview menu's right inset.<br />
>.useStaticWidth --- Use fixed width.<br />
>.barViewH --- Height of menu bar.<br />
>.staticWidth --- Fixed width value of fixed width.<br />
>.btnExtraWidth --- Extra width of menuBtn.

<br/><br/>
If you want to configure auto width, use

    init(useAutoWidthWithBarViewH barViewH: CGFloat,leftInset: CGFloat,rightInset: CGFloat, btnExtraWidth: CGFloat)
<br/>

If you want to configure the fixed width, use the

    init(useStaticWidthWithBarViewH barViewH: CGFloat,leftInset: CGFloat,rightInset: CGFloat, staticWidth: CGFloat)
    
<br/><br/><br/> 

Life cycle
===============
By using collectionview,CFPagesVC has a strict logical life cycle in managing your custom controller. Inside custom controller, the process of life cycle is printed in console to show the process of switching .
<br/><br/><br/> 
License
===============
This project is made available under the MIT license. See LICENSE.txt for details.
