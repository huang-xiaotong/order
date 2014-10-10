//
//  SecondViewController.h
//  order
//
//  Created by xyooyy on 14-9-17.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SecondViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
     UIScrollView *m_scrollView;
    UILabel *m_labelpeopleNull;
    UILabel *m_labelresNull;
    UILabel *m_labelcomboNull;
    UILabel *m_labelpriceNull;
//    NSString *m_path;
    NSString *m_orderfile;
}
@end
