//
//  ViewController.swift
//  YH_Toast_swift
//
//  Created by 余晗 on 1/11/16.
//  Copyright © 2016 yuhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var btn : UIButton = UIButton();
    override func viewDidLoad() {
        super.viewDidLoad()
       
        btn.frame=CGRectMake(0, 0, view.frame.width, 100);
        btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal);
        btn.setTitle("点我", forState: UIControlState.Normal);
        btn.addTarget(self, action:Selector("clickThisBtn:"), forControlEvents: UIControlEvents.TouchUpInside);
        view.addSubview(btn);
        // Do any additional setup after loading the view, typically from a nib.
    }

    func clickThisBtn(btn :UIButton)
    {
        NSLog("click");

        YH_Toast().showToastFromStr(btn.titleForState(UIControlState.Normal)!);
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

