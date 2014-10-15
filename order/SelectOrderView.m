//
//  SecondView.m
//  order
//
//  Created by xyooyy on 14-10-11.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "SelectOrderView.h"
#import "SelectOrderViewController.h"

@implementation SelectOrderView
@synthesize m_labelcomboNull;
@synthesize m_labelpeopleNull;
@synthesize m_labelpriceNull;
@synthesize m_labelresNull;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(void) selectorder :(CGRect)frame :(id)target :(SEL)peoplesel :(SEL)ressel :(SEL)combosel :(SEL)suresel
{
    m_scrollView = [self scrollView:frame :CGSizeMake( self.bounds.size.width, self.bounds.size.height * 1.2)];
    [self createLabel:CGRectMake(LABEL_FRAME_X, 15, LABEL_WIDTH, LABEL_HEIGHT) :LABEL_FONTSIZE :@"人:"];
    [self createLabel:CGRectMake(LABEL_FRAME_X, 160, LABEL_WIDTH, LABEL_HEIGHT) :LABEL_FONTSIZE :@"餐厅:"];
    [self createLabel:CGRectMake(LABEL_FRAME_X, 310, LABEL_WIDTH, LABEL_HEIGHT) :LABEL_FONTSIZE :@"套餐:"];
    [self selectorderonegrouplabelnulldata:CGRectMake(LABELNULLANDBUTTON_FRAME_X, 40, LABELNULLANDBUTTON_FRAME_WIDTH, LABELNULL_FRAME_HEIGHT) :LABEL_FONTSIZE :nil :CGRectMake(LABELNULLANDBUTTON_FRAME_X, 190, LABELNULLANDBUTTON_FRAME_WIDTH, LABELNULL_FRAME_HEIGHT) :CGRectMake(LABELNULLANDBUTTON_FRAME_X, 340, LABELNULLANDBUTTON_FRAME_WIDTH, LABELNULL_FRAME_HEIGHT)];
    [self selectorderonegroupbuttondata:CGRectMake(LABELNULLANDBUTTON_FRAME_X, 90, LABELNULLANDBUTTON_FRAME_WIDTH, BUTTON_FRAME_HEIGHT) :18 :@"选人" :target :peoplesel :CGRectMake(LABELNULLANDBUTTON_FRAME_X, 240, LABELNULLANDBUTTON_FRAME_WIDTH, BUTTON_FRAME_HEIGHT) :@"选餐厅" :ressel :CGRectMake(LABELNULLANDBUTTON_FRAME_X, 390, LABELNULLANDBUTTON_FRAME_WIDTH, BUTTON_FRAME_HEIGHT) :@"选套餐" :combosel :CGRectMake(LABELNULLANDBUTTON_FRAME_X, 440, LABELNULLANDBUTTON_FRAME_WIDTH, BUTTON_FRAME_HEIGHT) :@"确定" :suresel];
}
-(void) selectorderonegroupbuttondata:(CGRect)framepeoplebutton :(double)fontsizebutton :(NSString*)titlepeoplebutton :(id)target :(SEL)peoplesel :(CGRect)frameresbutton :(NSString*)titleresbutton :(SEL)ressel :(CGRect)framecombobutton :(NSString*)titlecombobutton :(SEL)combosel
:(CGRect)framesure :(NSString*)titlesure :(SEL)suresel
{
    peoplebutton = [self creatbutton:framepeoplebutton :fontsizebutton :titlepeoplebutton];
    [m_scrollView addSubview:peoplebutton];
    [peoplebutton addTarget:target action:peoplesel forControlEvents:UIControlEventTouchUpInside];
    resbutton = [self creatbutton:frameresbutton :fontsizebutton :titleresbutton];
    [m_scrollView addSubview:resbutton];
    [resbutton addTarget:target action:ressel forControlEvents:UIControlEventTouchUpInside];
    combobutton = [self creatbutton:framecombobutton :fontsizebutton :titlecombobutton];
    [m_scrollView addSubview:combobutton];
    [combobutton addTarget:target action:combosel forControlEvents:UIControlEventTouchUpInside];
    sure = [self creatbutton:framesure :fontsizebutton :titlesure];
    [m_scrollView addSubview:sure];
    [sure addTarget:target action:suresel forControlEvents:UIControlEventTouchUpInside];
}
-(void) selectorderonegrouplabelnulldata:(CGRect)firstlabelnull :(double)labelnullfontsize :(NSString*)labelnulltitle :(CGRect)secondlabelnull :(CGRect)thirdlabelnull
{
    m_labelpeopleNull = [self createLabel:firstlabelnull :labelnullfontsize :labelnulltitle];
    [m_scrollView addSubview:m_labelpeopleNull];
    m_labelpeopleNull.backgroundColor = [UIColor lightGrayColor];
    m_labelresNull = [self createLabel:secondlabelnull :labelnullfontsize :labelnulltitle];
    [m_scrollView addSubview:m_labelresNull];
    m_labelresNull.backgroundColor = [UIColor lightGrayColor];
    m_labelpriceNull = [self createLabel:thirdlabelnull :labelnullfontsize :labelnulltitle];
    m_labelcomboNull = [self createLabel:thirdlabelnull :labelnullfontsize :labelnulltitle];
    [m_scrollView addSubview: m_labelcomboNull];
    m_labelcomboNull.backgroundColor = [UIColor lightGrayColor];
    
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
    scrollView.delaysContentTouches=YES;
    return scrollView;
}

@end
