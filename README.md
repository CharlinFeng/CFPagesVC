![image](./CFPagesVC/show.jpg)<br />
##### 中国.成都冯成林原创，请支持原创，谢谢            --- Charlin Feng

# CFPagesVC
    Professional Multi controller management Framework based on Swift

<br /><br />
Chinese Fried Mention：
===============
<br />
#### 特别群：请西部省市朋友实名加入组织。其他地区朋友请添加2-4群：谢谢。
<br />
【西部区域】西部大开发群号： 473185026  -追赶北上广！为振兴西部IT而努力！<br />
热烈欢迎中国西部各省市的从事iOS开发朋友实名进群！本群为是聚集西部零散开发者，大家齐心协力共进退！ <br /><br />

【全国可加】四群： 347446259<br />
新开，可加！欢迎全国朋友加入组织 <br /><br />

【全国可加】三群： 474377358<br />
新开，可加！欢迎全国朋友加入组织 <br /><br />

【全国可加】二群： 369870753<br />
**WORNING: 已爆满，加不上了**<br /><br />

【全国可加】一群：163865401<br />
**WORNING: 已爆满，加不上了**<br /><br />

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

        /**  配置模型  */
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
Because of the use of collectionview，CFPagesVC management of your custom controller, has a strict logical life cycle，
In the custom controller inside, I print the life cycle of the process, you can view the output of the Xcode console, understand the process of switching the controller in your master, master their life cycle
<br/><br/><br/> 
License
===============
This project is made available under the MIT license. See LICENSE.txt for details.
