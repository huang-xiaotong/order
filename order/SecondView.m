//
//  SecondView.m
//  order
//
//  Created by xyooyy on 14-10-11.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "SecondView.h"

@implementation SecondView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void) secondview
{
    m_scrollView = [self scrollView:CGRectMake(0, 0, 320, 460) :CGSizeMake( self.bounds.size.width, self.bounds.size.height * 1.2)];
    [self createLabel:CGRectMake(15, 15, 30, 20) :16 :@"人:"];
    [self createLabel:CGRectMake(15, 160, 40, 20) :16 :@"餐厅:"];
    [self createLabel:CGRectMake(15, 310, 40, 20) :16 :@"套餐:"];
    [self selectorderonegrouplabelnulldata:CGRectMake(20, 40, 280, 40) :16 :NULL :CGRectMake(20, 190, 280, 40) :CGRectMake(20, 340, 280, 40)];
    [self selectorderonegroupbuttondata:CGRectMake(20, 90, 280, 50) :18 :@"选人" :CGRectMake(20, 240, 280, 50) :18 :@"选餐厅" :CGRectMake(20, 390, 280, 50) :18 :@"选套餐" :CGRectMake(20, 440, 280, 50) :18 :@"确定"];

}
-(void) selectorderonegroupbuttondata:(CGRect)framepeoplebutton :(double)fontsizepeoplebutton :(NSString*)titlepeoplebutton :(CGRect)frameresbutton :(double)fontsizeresbutton :(NSString*)titleresbutton :(CGRect)framecombobutton :(double)fontsizecombobutton :(NSString*)titlecombobutton
                                     :(CGRect)framesure :(double)fontsizesure :(NSString*)titlesure
{
    UIButton *peoplebutton = [self creatbutton:framepeoplebutton :fontsizepeoplebutton :titlepeoplebutton];
    [m_scrollView addSubview:peoplebutton];
    UIButton *resbutton = [self creatbutton:frameresbutton :fontsizeresbutton :titleresbutton];
    [m_scrollView addSubview:resbutton];
    UIButton *combobutton = [self creatbutton:framecombobutton :fontsizecombobutton :titlecombobutton];
    [m_scrollView addSubview:combobutton];
    UIButton *sure = [self creatbutton:framesure :fontsizesure :titlesure];
    [m_scrollView addSubview:sure];
    
}
-(void) selectorderonegrouplabelnulldata:(CGRect)firstlabelnull :(double)labelnullfontsize :(NSString*)labelnulltitle :(CGRect)secondlabelnull :(CGRect)thirdlabelnull
{
    m_labelpeopleNull = [self createLabel:firstlabelnull :labelnullfontsize :labelnulltitle];
    [m_scrollView addSubview:m_labelpeopleNull];
    m_labelpeopleNull.backgroundColor = [UIColor lightGrayColor];
    m_labelresNull = [self createLabel:secondlabelnull :labelnullfontsize :labelnulltitle];
    [m_scrollView addSubview:m_labelresNull];
    m_labelresNull.backgroundColor = [UIColor lightGrayColor];
    m_labelcomboNull = [self createLabel:thirdlabelnull :labelnullfontsize :labelnulltitle];
    [m_scrollView addSubview: m_labelcomboNull];
    m_labelcomboNull.backgroundColor = [UIColor lightGrayColor];
    m_labelpriceNull = [self createLabel:thirdlabelnull :labelnullfontsize :labelnulltitle];
}
- (UILabel *)createLabel:(CGRect)frame :(double)fontSize :(NSString *)title
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    label.text = title;
    [m_scrollView addSubview:label];
    return label;
}
- (UIButton *) creatbutton: (CGRect)frame :(double)fontSize :(NSString*)setTitle
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    button.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    [button setTitle:setTitle forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return button;
}
- (UIScrollView *)scrollView :(CGRect)frame :(CGSize)contentsize
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:frame];
    scrollView.contentSize = contentsize;
    scrollView.directionalLockEnabled = YES;
    [self addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.delaysContentTouches=YES;
    return scrollView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
