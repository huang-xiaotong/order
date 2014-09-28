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
     UIScrollView *scrollView;
    UILabel *label2;
    UILabel *label4;
    UILabel *label6;
    UILabel *label7;
    NSArray *arrorder;
}
@end
