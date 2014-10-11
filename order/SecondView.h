//
//  SecondView.h
//  order
//
//  Created by xyooyy on 14-10-11.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondView : UIView
<UITableViewDelegate, UITableViewDataSource>
{
    UIScrollView *m_scrollView;
    UILabel *m_labelpeopleNull;
    UILabel *m_labelresNull;
    UILabel *m_labelcomboNull;
    UILabel *m_labelpriceNull;
}
@end
