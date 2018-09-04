//
//  LinkAgeView.h
//  UIScrollviewAndButton
//
//  Created by 锋 on 2018/9/3.
//  Copyright © 2018年 ZifengJin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ButtonScroll.h"

@interface LinkAgeView : UIView

@property (nonatomic,strong)ButtonScroll *butonScr;

//  参数1:按钮view的位置  参数2:数组  按钮3:字体颜色  按钮4:点击之后的字体颜色 按钮5:按钮的type
-(void)btnFrame:(CGRect)butFrame
       Arrcount:(NSArray *)arrCount
     titlecolor:(UIColor *)color
       selecter:(UIColor *)selectColor
     buttonType:(UIButtonType *)btnType ;

//  参数1:scrollview的位置  参数2:开始的位置  按钮3:滚动的范围
-(void)scrollFrame:(CGRect)scrollFrame
      contentOfSet:(CGPoint)contentSet
       contentSize:(CGSize)make;

@end
