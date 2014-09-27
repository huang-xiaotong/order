//
//  ordViewController.h
//  order
//
//  Created by xyooyy on 14-9-18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ordViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *DataTable;
    NSString *datac;
    NSString *datap;
    NSString *datar;
    UITableViewCell *cell;
    UILabel *label;
    UILabel *label2;
    NSDictionary *dic2;
    UILabel *label4;
    UILabel *label1;
    UILabel *label3;
}
@end
