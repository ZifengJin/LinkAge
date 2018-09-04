//
//  LinkAgeView.m
//  UIScrollviewAndButton
//
//  Created by 锋 on 2018/9/3.
//  Copyright © 2018年 ZifengJin. All rights reserved.
//

#import "LinkAgeView.h"
@interface LinkAgeView ()<UIScrollViewDelegate>
{
    NSArray *arr;
    UIButton *linkBtn;
    UIView *smallview;
}
// 按钮的view
@property (nonatomic,strong)UIView *buttonView;


@end
@implementation LinkAgeView

-(instancetype)initWithFrame:(CGRect)frame{
 self =   [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

// //  参数1:按钮view的位置  参数2:数组  按钮3:字体颜色  按钮4:点击之后的字体颜色 按钮5:按钮的type

-(void)btnFrame:(CGRect)butFrame
       Arrcount:(NSArray *)arrCount
     titlecolor:(UIColor *)color
       selecter:(UIColor *)selectColor
     buttonType:(UIButtonType *)btnType {
    
    _buttonView = [[UIView alloc]initWithFrame:butFrame];
    arr = arrCount;
    // 按钮下面的线条
    smallview = [[UIView alloc]initWithFrame:CGRectMake(0, self.buttonView.bounds.size.height - 1, self.buttonView.bounds.size.width/arrCount.count, 1)];
    smallview.backgroundColor = selectColor;
    
    
    
   // 在buttonview上创建循环添加button
    for (int i = 0; i<arrCount.count; i++) {
       
        
        UIButton *button = [UIButton buttonWithType:btnType];
        button.tag = i + 100;
        
        button.frame = CGRectMake(i*self.buttonView.bounds.size.width/arrCount.count, 0, self.buttonView.bounds.size.width/arrCount.count, self.buttonView.bounds.size.height);
        [button setTitle:arrCount[i] forState:UIControlStateNormal];
        if (button.tag == 100) {
            button.selected = YES;
        }else{
            button.selected = NO;
        }
        // 按钮选中和非选中状态下的颜色
        [button setTitleColor:color forState:UIControlStateNormal];
        [button setTitleColor:selectColor forState:UIControlStateSelected];
        [button setTintColor:[UIColor whiteColor]];
        [button addTarget:self action:@selector(linkage:) forControlEvents:UIControlEventTouchUpInside];
        
        
        
        
        
        [self addSubview:self.buttonView];
        [self.buttonView addSubview:smallview];
        [self.buttonView addSubview:button];
    }

}
// 按钮点击事件
-(void)linkage:(UIButton *)button{
    // 线条根据点击改变而改变
    smallview.frame = CGRectMake((button.tag - 100)*self.buttonView.bounds.size.width/arr.count, _buttonView.bounds.size.height - 1, self.buttonView.bounds.size.width/arr.count, 1);
    // scrollview根据button的点击而改变
    [_butonScr setContentOffset:CGPointMake(self.frame.size.width *(button.tag - 100), 0)];

    // 点击之后改变button字体颜色
    for (int i = 0; i < arr.count; i++) {
        UIButton *btn = (UIButton *)[[button superview]viewWithTag:100+i ];
        [btn setSelected:NO];
    }
    UIButton *bb = (UIButton *)button;
    [bb setSelected:YES];
}

//  参数1:scrollview的位置  参数2:开始的位置  按钮3:滚动的范围
-(void)scrollFrame:(CGRect)scrollFrame contentOfSet:(CGPoint)contentSet contentSize:(CGSize)make{
    _butonScr = [[ButtonScroll alloc]initWithFrame:scrollFrame];
    // 开始位置
    [_butonScr setContentOffset:contentSet animated:YES];
    // 滚动范围
    _butonScr.contentSize = make;
    _butonScr.pagingEnabled = YES;
    _butonScr.tag = 200;
    
    _butonScr.delegate = self;
    [self addSubview:self.butonScr];
}
// scrollview 代理事件
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag == 200) {
        smallview.frame = CGRectMake(scrollView.contentOffset.x/self.buttonView.bounds.size.width*(self.bounds.size.width/arr.count),self.buttonView.bounds.size.height - 1, self.buttonView.bounds.size.width/arr.count, 1 ) ;
        for (int i= 0; i<arr.count; i++)
        {
            UIButton *but = [self viewWithTag:100+i];
            if (scrollView.contentOffset.x/self.frame.size.width == (but.tag -100))
            {
                but.selected = YES;

            }
            else
                
            {
                but.selected = NO;

                
            }
        }
        
    }
    
}

@end
