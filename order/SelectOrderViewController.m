//
//  SecondViewController.m
//  order
//
//  Created by xyooyy on 14-9-17.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "SelectOrderViewController.h"
#import "peopleViewController.h"
#import "resViewController.h"
#import "comboViewController.h"
#import "orderViewController.h"
#import "homeViewController.h"
#import "order.h"
#import "SelectOrderView.h"
@interface SelectOrderViewController ()

@end
@implementation SelectOrderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"订餐";
    mSecond = [[SelectOrderView alloc]initWithFrame:self.view.bounds];
    [mSecond selectorder:CGRectMake(0, 0, 320, 460) :self :@selector(selectpeoplepress:) :@selector(selectrespress:) :@selector(selectcombopress:) :@selector(sure:)];
    [self.view addSubview:mSecond];
    [self notification:@selector(peoHandleInfo:) :@"peoInfo" :@selector(resHandleInfo:) :@"resInfo" :@selector(comHandleInfo:) :@"comInfo" :@selector(priceHandleInfo:) :@"priceInfo"];
}
-(void) notification :(void*)peoplevalue :(NSString*)peoinfo :(void*)resvalue : (NSString*)resinfo :(void*)combovalue :(NSString*)cominfo :(void*)pricevalue :(NSString*)priceinfo
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:peoplevalue name:peoinfo object:nil];
    [center addObserver:self selector:resvalue name:resinfo object:nil];
    [center addObserver:self selector:combovalue name:cominfo object:nil];
    [center addObserver:self selector:pricevalue name:priceinfo object:nil];
}
-(void)back
{
    NSArray *ay=self.navigationController.viewControllers;
    [self.navigationController popToViewController:[ay objectAtIndex:0] animated:YES];
}
- (void)selectpeoplepress:(id)sender
{
    peopleViewController *nextController = [[peopleViewController alloc]init];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:nextController animated:YES];
}
- (void)selectrespress:(id)sender
{
    resViewController *nextController = [[resViewController alloc]init];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
    [self.navigationController pushViewController:nextController animated:YES];
}
- (void)selectcombopress:(id)sender
{
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
-(void)selectsure 
{
    order *orderClassObject = [[order alloc]init];
    [orderClassObject save:mSecond.m_labelpeopleNull.text :mSecond.m_labelresNull.text :mSecond.m_labelcomboNull.text :mSecond.m_labelpriceNull.text];
    mSecond.m_labelpriceNull.text = nil;
    mSecond.m_labelpeopleNull.text = nil;
    mSecond.m_labelresNull.text = nil;
    mSecond.m_labelcomboNull.text = nil;
}
- (void)sure:(id)sender
{
    if (mSecond.m_labelpeopleNull.text != nil & mSecond.m_labelpriceNull.text != nil & mSecond.m_labelcomboNull.text != nil)
    {
        [self selectsure];
    }
    else
    {
    UIAlertView *alert=[self creatalert:@"数据未保存"];
    [alert show];
    }
}
-(void)peoHandleInfo:(NSNotification *)notification{
    NSString *data = [notification object];
    mSecond.m_labelpeopleNull.text = data;
}
-(void)resHandleInfo:(NSNotification *)notification{
    NSString *datar = [notification object];
    mSecond.m_labelresNull.text = datar;
}
-(void)comHandleInfo:(NSNotification *)notification{
    NSString *datac = [notification object];
    mSecond.m_labelcomboNull.text = datac;
}
-(void)priceHandleInfo:(NSNotification *)notification{
    NSString *datap = [notification object];
    mSecond.m_labelpriceNull.text = datap;
}
@end