//
//  ViewController.m
//  order
//
//  Created by xyooyy on 14-9-17.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "homeViewController.h"
#import "SelectOrderViewController.h"
#import "orderViewController.h"

@interface homeViewController ()

@end

@implementation homeViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"订餐";
    self.navigationController.navigationBar.barStyle =
    UIBarStyleBlackOpaque;
    self.view.backgroundColor = [UIColor whiteColor];
    [self button];
}
-(void)button
{
    UIButton *order = [self creatbutton:CGRectMake(10, 70, 300, 50):18:@"帮订餐"];
    [self.view addSubview:order];
    [order addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *lookorder = [self creatbutton:CGRectMake(10, 120, 300, 50):18:@"看订单"];
    [self.view addSubview:lookorder];
    [lookorder addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
}
- (UIButton *) creatbutton: (CGRect)frame :(double)fontSize :(NSString*)setTitle 
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    button.titleLabel.font = [UIFont boldSystemFontOfSize:fontSize];
    [button setTitle:setTitle forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    return button;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark -
#pragma mark Table View Delegate Methods
- (void)onClick:(id)sender{
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:@selector(back)];
    [self.navigationItem setBackBarButtonItem:backItem];
    SelectOrderViewController *nextController = [[SelectOrderViewController alloc]init];
    [self.navigationController pushViewController:nextController animated:YES];
  }
- (void)Click:(id)sender{
    orderViewController *nextController = [[orderViewController alloc]init];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:nextController animated:YES];
}
@end
