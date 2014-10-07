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
    UILabel *labelpeople = [self createLabel:CGRectMake(15, 15, 30, 20) :16 :@"人:" ];
    [scrollView addSubview:labelpeople];
    //label 空白 人
    labelpeopleNull = [self createLabel:CGRectMake(20, 40, 280, 40) :16 :NULL];
    labelpeopleNull.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:labelpeopleNull];
    //button 选人
    UIButton *butpeople = [self creatbutton:CGRectMake(20, 90, 280, 50) :18 :@"选人"];
    [scrollView addSubview:butpeople];
    [butpeople addTarget:self action:@selector(people:) forControlEvents:UIControlEventTouchUpInside];
    //label 餐厅
    UILabel *labelres = [self createLabel:CGRectMake(15, 160, 40, 20) :16 :@"餐厅:"];
    [scrollView addSubview:labelres];
    //label 空白 餐厅
    labelresNull = [self createLabel:CGRectMake(20, 190, 280, 40) :16 :NULL];
    labelresNull.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:labelresNull];
    //button 选餐厅
    UIButton *butres = [self creatbutton:CGRectMake(20, 240, 280, 50) :18 :@"选餐厅"];
    [scrollView addSubview:butres];
    [butres addTarget:self action:@selector(res:) forControlEvents:UIControlEventTouchUpInside];
    //label 套餐
    UILabel *labelcombo = [self createLabel:CGRectMake(15, 310, 40, 20) :16 :@"套餐:"];
    [scrollView addSubview:labelcombo];
    //label 空白 套餐
    labelcomboNull = [self createLabel:CGRectMake(20, 340, 280, 40) :16 :NULL];
    labelcomboNull.backgroundColor = [UIColor lightGrayColor];
    [scrollView addSubview:labelcomboNull];
    //label7 空白 价格
    labelpriceNull = [self createLabel:CGRectMake(20, 340, 280, 40) :16 :NULL];
    //button 选套餐
    UIButton *butcombo = [self creatbutton:CGRectMake(20, 390, 280, 50) :18 :@"选套餐"];
    [scrollView addSubview:butcombo];
    [butcombo addTarget:self action:@selector(combo:) forControlEvents:UIControlEventTouchUpInside];
    //button 确定
    UIButton *sure = [self creatbutton:CGRectMake(20, 440, 280, 50) :18 :@"确定"];
    [scrollView addSubview:sure];
    [sure addTarget:self action:@selector(sure:) forControlEvents:UIControlEventTouchUpInside];
}
- (UILabel *)createLabel:(CGRect)frame :(double)fontSize :(NSString *)title 
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    label.text = title;
    return label;
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
- (UIAlertView *) creatalert:(NSString *)message
{
UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:self cancelButtonTitle:@"请重新选择" otherButtonTitles:nil, nil];
    return alert;
}
- (void)sure:(id)sender{
    //保存数据
    if (labelpeopleNull.text != NULL & labelpriceNull.text != NULL & labelcomboNull.text != NULL)
    {
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);  
        NSString *path=[paths objectAtIndex:0];
        NSString *orderfile=[path stringByAppendingPathComponent:@"ordered.plist"];
        NSFileManager *ordered = [NSFileManager defaultManager];
            if (![[NSFileManager defaultManager] fileExistsAtPath:orderfile])
                {
                    [ordered createFileAtPath:orderfile contents:nil attributes:nil];
                    NSArray *arrorder =[[NSArray alloc]initWithObjects:labelpeopleNull.text, labelresNull.text, labelcomboNull.text, labelpriceNull.text, nil];
                    NSArray *arrord = [[NSArray alloc]initWithObjects:arrorder, nil];
                    [arrord writeToFile:orderfile atomically:YES];
                }
            else
                {
                    NSMutableArray *arrordered = [NSArray arrayWithContentsOfFile:orderfile];
                    NSArray *arradd = [[NSArray alloc]initWithObjects:labelpeopleNull.text, labelresNull.text, labelcomboNull.text, labelpriceNull.text, nil];
                    [arrordered addObject:arradd];
                    [arrordered writeToFile:orderfile atomically:YES];
                }
            labelpriceNull.text = NULL;
            labelpeopleNull.text = NULL;
            labelresNull.text = NULL;
            labelcomboNull.text = NULL;
    }
    else
    {
    UIAlertView *alert=[self creatalert:@"数据未保存"];
    [alert show];
    }
}
-(void)peoHandleInfo:(NSNotification *)notification{
    NSString *data = [notification object];
    labelpeopleNull.text = data;
}
-(void)resHandleInfo:(NSNotification *)notification{
    NSString *datar = [notification object];
    labelresNull.text = datar;
}
-(void)comHandleInfo:(NSNotification *)notification{
    NSString *datac = [notification object];
    labelcomboNull.text = datac;
}
-(void)comboHandleInfo:(NSNotification *)notification{
    NSString *datap = [notification object];
    labelpriceNull.text = datap;
}
@end