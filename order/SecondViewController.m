//
//  SecondViewController.m
//  order
//
//  Created by xyooyy on 14-9-17.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "SecondViewController.h"
#import "peopleViewController.h"
#import "resViewController.h"
#import "comboViewController.h"
@interface SecondViewController ()

@end


@implementation SecondViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    scrollView.contentSize = CGSizeMake( self.view.bounds.size.width, self.view.bounds.size.height * 1.2);
//    scrollView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    scrollView.directionalLockEnabled = YES;
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.delaysContentTouches=YES;
    //nsnotification 
    NSNotificationCenter *center2 = [NSNotificationCenter defaultCenter];//取得NSNotification对象
    [center2 addObserver:self selector:@selector(oneObjectHandleInfo:) name:@"logInfo" object:nil];//注册自己为监听者，当有消息过来
    //label人
    CGRect labelRect = CGRectMake(15, 15, 30, 20);
    UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
    label.text = @"人:";
    label.font = [UIFont boldSystemFontOfSize:16];
    [scrollView addSubview:label];
    //label 空白 人
    CGRect label2Rect = CGRectMake(20, 40, 280, 40);
    UILabel *label2 = [[UILabel alloc] initWithFrame:label2Rect];
    label2.font = [UIFont boldSystemFontOfSize:16];
    label2.backgroundColor = [UIColor lightGrayColor];
//    label2.text = ;
    label2.textColor = [UIColor redColor];
    [scrollView addSubview:label2];
    //button 选人
    CGRect frame = CGRectMake(20, 90, 280, 50);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:@"选人"forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:button];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    //label 餐厅
    CGRect label3Rect = CGRectMake(15, 160, 40, 20);
    UILabel *label3 = [[UILabel alloc] initWithFrame:label3Rect];
    label3.text = @"餐厅:";
    label3.font = [UIFont boldSystemFontOfSize:16];
    [scrollView addSubview:label3];
    //label 空白 餐厅
    CGRect label4Rect = CGRectMake(20, 190, 280, 40);
    UILabel *label4 = [[UILabel alloc] initWithFrame:label4Rect];
    label4.font = [UIFont boldSystemFontOfSize:16];
    label4.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:label4];
    //button 选餐厅
    CGRect frame2 = CGRectMake(20, 240, 280, 50);
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = frame2;
    [button2 setTitle:@"选餐厅"forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor clearColor];
    button2.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:button2];
    [button2 addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    //label 套餐
    CGRect label5Rect = CGRectMake(15, 310, 40, 20);
    UILabel *label5 = [[UILabel alloc] initWithFrame:label5Rect];
    label5.text = @"套餐:";
    label5.font = [UIFont boldSystemFontOfSize:16];
    [scrollView addSubview:label5];
    //label 空白 套餐
    CGRect label6Rect = CGRectMake(20, 340, 280, 40);
    UILabel *label6 = [[UILabel alloc] initWithFrame:label6Rect];
    label6.font = [UIFont boldSystemFontOfSize:16];
    label6.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:label6];
    //button 选套餐
    CGRect frame3 = CGRectMake(20, 390, 280, 50);
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = frame3;
    [button3 setTitle:@"选套餐"forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor clearColor];
    button3.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:button3];
    [button3 addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
    //button 确定
    CGRect frame4 = CGRectMake(20, 440, 280, 50);
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = frame4;
    [button4 setTitle:@"确定"forState:UIControlStateNormal];
    button4.backgroundColor = [UIColor clearColor];
    button4.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:button4];
    [button4 addTarget:self action:@selector(on:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
}
- (void)onClick:(id)sender{
    peopleViewController *nextController = [[peopleViewController alloc]init];
    [self.navigationController pushViewController:nextController animated:YES];
}
- (void)Click:(id)sender{
    resViewController *nextController = [[resViewController alloc]init];
    [self.navigationController pushViewController:nextController animated:YES];}
- (void)press:(id)sender{
    comboViewController *nextController = [[comboViewController alloc]init];
    [self.navigationController pushViewController:nextController animated:YES];}
- (void)on:(id)sender{
    SecondViewController *nextController = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:nextController animated:YES];
    }
-(void)oneObjectHandleInfo:(NSNotification *)notification{
    NSString *data = [notification object];
    NSLog(@">>2>> %@",data);
    
}
@end