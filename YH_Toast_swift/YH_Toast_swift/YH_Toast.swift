//
//  YH_Toast.swift
//  testSwift
//
//  Created by 余晗 on 1/11/16.
//  Copyright © 2016 余晗. All rights reserved.
//

import UIKit
let toastFont  : CGFloat = 12;
let toastStrColor = UIColor.whiteColor();
let BGColor = UIColor(colorLiteralRed: 39/255, green: 39/255, blue: 39/255, alpha: 1);
class YH_Toast: UIView {

    var contentView :UIView = UIView();
     func getStrSize(text:String,font:UIFont,size:CGSize) -> CGRect {
         let strAtt = [NSFontAttributeName: font]
        let needOption = NSStringDrawingOptions.UsesLineFragmentOrigin
        let rect:CGRect = text.boundingRectWithSize(size, options: needOption, attributes: strAtt, context: nil)
        return rect;
    }
    
    func showToastFromStr(str :String)
    {
        let lastWindows = UIApplication.sharedApplication().windows.last;
        
        let screenWidth  = UIScreen.mainScreen().bounds.size.width;
        let screenHeight = UIScreen.mainScreen().bounds.size.height;
        
        let strSize = getStrSize(str, font: UIFont.systemFontOfSize(toastFont), size:CGSizeMake(screenWidth-60, 200));
        
        let realViewHeight = 20 + screenHeight ;
      
      contentView.frame = CGRectMake((screenWidth-(strSize.width+20))/2, realViewHeight-strSize.height-40-20,strSize.width+20, strSize.height+20);
        contentView.layer.cornerRadius = 5;
        contentView.layer.shadowColor = UIColor.blackColor().CGColor;
        contentView.layer.shadowOffset = CGSizeMake(0, 0);
        contentView.layer.shadowOpacity = 0.5;
        contentView.layer.shadowRadius = 1;
        contentView.backgroundColor=BGColor;
        lastWindows!.addSubview(contentView);
        
        let lbl = UILabel(frame: CGRectMake(0, 0, contentView.frame.size.width,contentView.frame.size.height));
        lbl.textAlignment=NSTextAlignment.Center;
        lbl.textColor=toastStrColor;
        lbl.font = UIFont.systemFontOfSize(toastFont);
        lbl.text = str;
        lbl.numberOfLines = 10;
        contentView.addSubview(lbl);
        
        UIView.animateWithDuration(3,animations:
            { ()-> Void in
                self.contentView.alpha=0;
            },
            completion:{
                (finished:Bool) -> Void in
                self.contentView.removeFromSuperview();
                lbl.removeFromSuperview();
        })
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func drawRect(rect: CGRect) {
              // Drawing code
//    }


}
