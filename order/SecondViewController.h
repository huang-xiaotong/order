//
//  SecondViewController.h
//  order
//
//  Created by xyooyy on 14-9-17.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SecondView.h"
#import "DefineHeader.h"

@interface SecondViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    NSString *m_path;
    NSString *m_orderfile;
    SecondView *mSecond;
}
@end
