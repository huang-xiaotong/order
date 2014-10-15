//
//  SecondView.h
//  order
//
//  Created by xyooyy on 14-10-11.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefineHeader.h"

@interface SelectOrderView : UIView
{
    UIScrollView *m_scrollView;
    UILabel *m_labelpeopleNull;
    UILabel *m_labelresNull;
    UILabel *m_labelcomboNull;
    UILabel *m_labelpriceNull;
    UIButton *peoplebutton;
    UIButton *resbutton;
    UIButton *combobutton;
    UIButton *sure;
}
@property(nonatomic,retain)UILabel *m_labelpeopleNull;
@property(nonatomic,retain)UILabel *m_labelresNull;
@property(nonatomic,retain)UILabel *m_labelcomboNull;
@property(nonatomic,retain)UILabel *m_labelpriceNull;
-(void) selectorder :(CGRect)frame :(id)target :(SEL)peoplesel :(SEL)ressel :(SEL)combosel :(SEL)suresel;
@end
