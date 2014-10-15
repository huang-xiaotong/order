//
//  SecondViewController.h
//  order
//
//  Created by xyooyy on 14-9-17.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SelectOrderView.h"
#import "DefineHeader.h"

@interface SelectOrderViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    NSString *m_path;
    NSString *m_orderfile;
    SelectOrderView *mSecond;
}
@end
