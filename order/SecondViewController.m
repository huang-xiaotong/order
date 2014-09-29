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
#import "ordViewController.h"
#import "ViewController.h"
@interface SecondViewController ()

@end


@implementation SecondViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"订餐";
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:@selector(back)];
//    [self.navigationItem setBackBarButtonItem:backItem];
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    scrollView.contentSize = CGSizeMake( self.view.bounds.size.width, self.view.bounds.size.height * 1.2);
    scrollView.directionalLockEnabled = YES;
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.delaysContentTouches=YES;
    //nsnotification 
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];//取得NSNotification对象
    [center addObserver:self selector:@selector(peoHandleInfo:) name:@"logInfo" object:nil];//注册自己为监听者，当有消息过来
    [center addObserver:self selector:@selector(resHandleInfo:) name:@"resInfo" object:nil];
    [center addObserver:self selector:@selector(comHandleInfo:) name:@"comInfo" object:nil];
    [center addObserver:self selector:@selector(comboHandleInfo:) name:@"comboInfo" object:nil];
    //labelpeople 人
    CGRect labelRect = CGRectMake(15, 15, 30, 20);
    UILabel *labelpeople = [[UILabel alloc] initWithFrame:labelRect];
    labelpeople.text = @"人:";
    labelpeople.font = [UIFont boldSystemFontOfSize:16];
    [scrollView addSubview:labelpeople];
    //label 空白 人
    CGRect label2Rect = CGRectMake(20, 40, 280, 40);
    labelpeopleNull = [[UILabel alloc] initWithFrame:label2Rect];
    labelpeopleNull.font = [UIFont boldSystemFontOfSize:16];
    labelpeopleNull.enabled = YES;
    labelpeopleNull.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:labelpeopleNull];
    //button 选人
    CGRect frame = CGRectMake(20, 90, 280, 50);
    UIButton *butpeople = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    butpeople.frame = frame;
    [butpeople setTitle:@"选人"forState:UIControlStateNormal];
    butpeople.backgroundColor = [UIColor clearColor];
    butpeople.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [butpeople setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:butpeople];
    [butpeople addTarget:self action:@selector(people:) forControlEvents:UIControlEventTouchUpInside];
    //label 餐厅
    CGRect label3Rect = CGRectMake(15, 160, 40, 20);
    UILabel *labelres = [[UILabel alloc] initWithFrame:label3Rect];
    labelres.text = @"餐厅:";
    labelres.font = [UIFont boldSystemFontOfSize:16];
    [scrollView addSubview:labelres];
    //label 空白 餐厅
    CGRect label4Rect = CGRectMake(20, 190, 280, 40);
    labelresNull = [[UILabel alloc] initWithFrame:label4Rect];
    labelresNull.font = [UIFont boldSystemFontOfSize:16];
    labelresNull.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:labelresNull];
    //button 选餐厅
    CGRect frame2 = CGRectMake(20, 240, 280, 50);
    UIButton *butres = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    butres.frame = frame2;
    [butres setTitle:@"选餐厅"forState:UIControlStateNormal];
    butres.backgroundColor = [UIColor clearColor];
    butres.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [butres setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:butres];
    [butres addTarget:self action:@selector(res:) forControlEvents:UIControlEventTouchUpInside];
    //label 套餐
    CGRect label5Rect = CGRectMake(15, 310, 40, 20);
    UILabel *labelcombo = [[UILabel alloc] initWithFrame:label5Rect];
    labelcombo.text = @"套餐:";
    labelcombo.font = [UIFont boldSystemFontOfSize:16];
    [scrollView addSubview:labelcombo];
    //label 空白 套餐
    CGRect label6Rect = CGRectMake(20, 340, 280, 40);
    labelcomboNull = [[UILabel alloc] initWithFrame:label6Rect];
    labelcomboNull.font = [UIFont boldSystemFontOfSize:16];
    labelcomboNull.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:labelcomboNull];
    //label7 空白 价格
    CGRect label7Rect = CGRectMake(20, 340, 280, 40);
    labelpriceNull = [[UILabel alloc]initWithFrame:label7Rect];
    //button 选套餐
    CGRect frame3 = CGRectMake(20, 390, 280, 50);
    UIButton *butcombo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    butcombo.frame = frame3;
    [butcombo setTitle:@"选套餐"forState:UIControlStateNormal];
    butcombo.backgroundColor = [UIColor clearColor];
    butcombo.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [butcombo setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:butcombo];
    [butcombo addTarget:self action:@selector(combo:) forControlEvents:UIControlEventTouchUpInside];
    //button 确定
    CGRect frame4 = CGRectMake(20, 440, 280, 50);
    UIButton *sure = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    sure.frame = frame4;
    [sure setTitle:@"确定"forState:UIControlStateNormal];
    sure.backgroundColor = [UIColor clearColor];
    sure.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [sure setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [scrollView addSubview:sure];
    [sure addTarget:self action:@selector(sure:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)back
{
    NSArray *ay=self.navigationController.viewControllers;
    [self.navigationController popToViewController:[ay objectAtIndex:0] animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
}

- (void)people:(id)sender{
    peopleViewController *nextController = [[peopleViewController alloc]init];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:nextController animated:YES];
}
- (void)res:(id)sender{
    resViewController *nextController = [[resViewController alloc]init];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:nextController animated:YES];
}
- (void)combo:(id)sender{
    comboViewController *nextController = [[comboViewController alloc]init];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:nextController animated:YES];
}
- (void)sure:(id)sender{
//    SecondViewController *nextController = [[SecondViewController alloc]init];
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(back)];
//    [self.navigationItem setBackBarButtonItem:backItem];
//    [self.navigationController pushViewController:nextController animated:YES];
    //保存数据
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);  
    NSString *path=[paths objectAtIndex:0];
//    NSLog(@"path = %@",path);
    NSString *orderfile=[path stringByAppendingPathComponent:@"ordered.plist"];
    NSFileManager *ordered = [NSFileManager defaultManager];
        if (![[NSFileManager defaultManager] fileExistsAtPath:orderfile])
    {
        [ordered createFileAtPath:orderfile contents:nil attributes:nil];
        NSArray *arrorder =[[NSArray alloc]initWithObjects:labelpeopleNull.text, labelresNull.text, labelcomboNull.text, labelpriceNull.text, nil];
        if (labelpeopleNull.text == nil) {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"人名不能为空" delegate:self cancelButtonTitle:@"重新选择" otherButtonTitles:nil, nil];
            [alert show];
        }
        if (labelresNull.text == nil) {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"餐厅不能为空" delegate:self cancelButtonTitle:@"重新选择" otherButtonTitles:nil, nil];
            [alert show];
        }
        if (labelcomboNull.text == nil) {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"套餐不能为空" delegate:self cancelButtonTitle:@"重新选择" otherButtonTitles:nil, nil];
            [alert show];
        }
        NSArray *arrord = [[NSArray alloc]initWithObjects:arrorder, nil];
        [arrord writeToFile:orderfile atomically:YES];
//        NSLog(@" %@",arrord);
    }
    else
    {
         NSMutableArray *arrordered = [NSArray arrayWithContentsOfFile:orderfile];
        NSArray *arradd = [[NSArray alloc]initWithObjects:labelpeopleNull.text, labelresNull.text, labelcomboNull.text, labelpriceNull.text, nil];
        if (labelpeopleNull.text == nil) {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"人名不能为空" delegate:self cancelButtonTitle:@"重新选择" otherButtonTitles:nil, nil];
            [alert show];
        }
        if (labelresNull.text == nil) {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"餐厅不能为空" delegate:self cancelButtonTitle:@"重新选择" otherButtonTitles:nil, nil];
            [alert show];
        }
        if (labelcomboNull.text == nil) {
            UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:@"套餐不能为空" delegate:self cancelButtonTitle:@"重新选择" otherButtonTitles:nil, nil];
            [alert show];
        }
        [arrordered addObject:arradd];
        [arrordered writeToFile:orderfile atomically:YES];
//        NSLog(@"%@",arrordered);
    }
    labelpriceNull.text = NULL;
    labelpeopleNull.text = NULL;
    labelresNull.text = NULL;
    labelcomboNull.text = NULL;
    
}
-(void)peoHandleInfo:(NSNotification *)notification{
    NSString *data = [notification object];
    labelpeopleNull.text = data;
//    NSLog(@"%@",label2.text);
//    NSLog(@">>2>> %@",data);
}
-(void)resHandleInfo:(NSNotification *)notification{
    NSString *datar = [notification object];
    labelresNull.text = datar;
//    NSLog(@" %@", datar);
}
-(void)comHandleInfo:(NSNotification *)notification{
    NSString *datac = [notification object];
    labelcomboNull.text = datac;
}
-(void)comboHandleInfo:(NSNotification *)notification{
    NSString *datap = [notification object];
    labelpriceNull.text = datap;
//    NSLog(@"  %@",datap);
}
@end