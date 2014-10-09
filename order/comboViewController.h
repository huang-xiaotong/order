//
//  comboViewController.h
//  order
//
//  Created by xyooyy on 14-9-18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface comboViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *m_TableView;
    NSArray *m_listData;
    NSArray *m_listDatap;
}
@property (nonatomic, retain) NSArray *m_listData;
@property (nonatomic, retain) NSArray *m_listDatap;
@end
