//
//  ordViewController.h
//  order
//
//  Created by xyooyy on 14-9-18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface orderViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource>
{
    UILabel *m_labelres;
    UILabel *m_labelprice;
    UILabel *m_labelpeople;
    UILabel *m_labelcombo;
    NSMutableArray *m_arrpeople;
    NSArray *m_arrOrdered;
    UITableViewCell *m_cell;
}
@end
