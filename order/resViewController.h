//
//  resViewController.h
//  order
//
//  Created by xyooyy on 14-9-18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface resViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *rTableView;
    NSArray *listDatar;
}
@property (nonatomic, retain) NSArray *listDatar;
@end
