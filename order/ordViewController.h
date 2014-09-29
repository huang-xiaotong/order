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
    UILabel *labelres;
    UILabel *labelprice;
    UILabel *labelpeople;
    UILabel *labelcombo;
    NSMutableArray *arrpeople;
    NSArray *m_arrOrdered;
}
@end
