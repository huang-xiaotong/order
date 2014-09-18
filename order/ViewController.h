//
//  ViewController.h
//  order
//
//  Created by xyooyy on 14-9-17.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
//    UIBarButtonItem *myButton;
    UITableView *mTableView;
}
@property (nonatomic, retain) NSArray *myButton;
@end
