//
//  ViewController.swift
//  ProjectOne
//
//  Created by Gantulga ts on 11/1/15.
//  Copyright © 2015 Gantulga ts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var bottomViews:NSMutableArray = NSMutableArray()
    var currentViewController:UIViewController!
    var challangeNavigationViewController:UINavigationController!
    var forumsNavigationViewController:UINavigationController!
    var notificationNavigationViewController:UINavigationController!
    var bottomToolBar:UIToolbar = UIToolbar();
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        self.configBottomBar()

        self.challangeNavigationViewController = UINavigationController(rootViewController: ChallangeViewController())
        self.forumsNavigationViewController = UINavigationController(rootViewController: ForumViewController())
        self.notificationNavigationViewController = UINavigationController(rootViewController: NotificationViewController())
        self.setMainController(self.challangeNavigationViewController)
//        barView1.addSubview(label1)
        
        
//        let barButtonItem1  = UIBarButtonItem(customView: barView1);
//        
//        
//        let toolbarButtonItems = [
//            barButtonItem1
//        ]
//        toolbar.setItems(toolbarButtonItems, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    func configBottomBar () {
        bottomToolBar.frame = CGRectMake(0,self.view.bounds.height-64,self.view.bounds.width,64)
        self.view.addSubview(bottomToolBar);
        let width:CGFloat = 100.0;
        let diff:CGFloat = (self.view.bounds.size.width/3-width)/2;
        
        let button1 = GSBarButtonItem(frame: CGRectMake(diff,11,width,40), title: "CHALLANGES", imageName: "ic_tab_Challenges");
        button1.setHighligthed(true)
        let recognizer1 = UITapGestureRecognizer(target: self, action: "selectedChallanges")
        button1.addGestureRecognizer(recognizer1)
        bottomToolBar.addSubview(button1)
        bottomViews.addObject(button1);
        
        let button2 = GSBarButtonItem(frame: CGRectMake(self.view.bounds.width/3+diff,11,width,40), title: "FORUMS", imageName: "ic_tab_Forums");
        let recognizer2 = UITapGestureRecognizer(target: self, action: "selectedForum")
        button2.addGestureRecognizer(recognizer2)
        bottomToolBar.addSubview(button2)
        bottomViews.addObject(button2);

        let button3 = GSBarButtonItem(frame: CGRectMake(self.view.bounds.width/3*2+diff,11,width,40), title: "NOTIFICATIONS", imageName: "ic_tab_Notification");
        let recognizer3 = UITapGestureRecognizer(target: self, action: "selectedNotification")
        button3.addGestureRecognizer(recognizer3)
        bottomToolBar.addSubview(button3)
        bottomViews.addObject(button3);

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setMainController (controller :UIViewController) {
        self.currentViewController = controller
        controller.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64);
        self.view.addSubview(self.currentViewController.view);
        self.addChildViewController(self.currentViewController);
        self.view.bringSubviewToFront(self.bottomToolBar)
    }
    func selectedChallanges() {
        let button1 = self.bottomViews[0] as! GSBarButtonItem;
        button1.setHighligthed(true)
        let button2 = self.bottomViews[1] as! GSBarButtonItem;
        button2.setHighligthed(false)
        let button3 = self.bottomViews[2] as! GSBarButtonItem;
        button3.setHighligthed(false)
        self.setMainController(self.challangeNavigationViewController);
    }
    
    func selectedForum() {
        let button1 = self.bottomViews[0] as! GSBarButtonItem;
        button1.setHighligthed(false)
        let button2 = self.bottomViews[1] as! GSBarButtonItem;
        button2.setHighligthed(true)
        let button3 = self.bottomViews[2] as! GSBarButtonItem;
        button3.setHighligthed(false)
        self.setMainController(self.forumsNavigationViewController);

    }
    
    func selectedNotification() {
        let button1 = self.bottomViews[0] as! GSBarButtonItem;
        button1.setHighligthed(false)
        let button2 = self.bottomViews[1] as! GSBarButtonItem;
        button2.setHighligthed(false)
        let button3 = self.bottomViews[2] as! GSBarButtonItem;
        button3.setHighligthed(true)
        self.setMainController(self.notificationNavigationViewController);

    }

}

