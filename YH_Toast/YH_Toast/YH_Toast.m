//
//  YH_Toast.m
//  qtz
//
//  Created by 余晗 on 12/2/15.
//  Copyright (c) 2015 tmbj. All rights reserved.
//

#import "YH_Toast.h"
#import "AppDelegate.h"
@implementation YH_Toast
+(void)showToastFromStr:(NSString *)str
{
    
    UIWindow *window = [[[UIApplication sharedApplication] windows] lastObject];

  float screenWidth=[[UIScreen mainScreen] bounds].size.width;
  float screenHeight=[[UIScreen mainScreen] bounds].size.height;
  CGSize strSize=[str sizeWithFont:[UIFont systemFontOfSize:ToastFont] constrainedToSize:CGSizeMake(screenWidth-60, 200)];
  float realViewHeight=0.f;
  if([[[UIDevice currentDevice] systemVersion] floatValue]>7.0)
  {
    realViewHeight=20.f+screenHeight;
  }
  else
  {
   realViewHeight=0.f+screenHeight;
  }
  
  UIView *contentView=[[UIView alloc] initWithFrame:CGRectMake((screenWidth-(strSize.width+20))/2, realViewHeight-strSize.height-40-20,strSize.width+20, strSize.height+20)];
  contentView.layer.cornerRadius=5.f;
  contentView.layer.shadowColor = [UIColor blackColor].CGColor;
  contentView.layer.shadowOffset = CGSizeMake(0, 0);
  contentView.layer.shadowOpacity = 0.5;
  contentView.layer.shadowRadius = 1;
  [contentView setBackgroundColor:BGColor];
  [window addSubview:contentView];

  UILabel *lbl=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, contentView.frame.size.width,contentView.frame.size.height)];
  [lbl setTextAlignment:NSTextAlignmentCenter];
  [lbl setTextColor:ToastStrColor];
  [lbl setFont:[UIFont systemFontOfSize:ToastFont]];
  [lbl setText:str];
  [lbl setNumberOfLines:10];
  [contentView addSubview:lbl];
  
  [UIView animateWithDuration:3.f animations:^{
    contentView.alpha=0.f;
     } completion:^(BOOL finished) {
       [lbl removeFromSuperview];
       [contentView removeFromSuperview];
     }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
