//
//  YH_Toast.h
//  qtz
//
//  Created by 余晗 on 12/2/15.
//  Copyright (c) 2015 tmbj. All rights reserved.
//
#define ToastFont 12.f
#define ToastStrColor [UIColor whiteColor]
#define BGColor [UIColor colorWithRed:39/255. green:39/255. blue:39/255. alpha:1]
#import <UIKit/UIKit.h>

@interface YH_Toast : UIView
+(void)showToastFromStr:(NSString *)str;
@end
