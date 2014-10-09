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
    m_scrollView = [self scrollView:CGRectMake(0, 0, 320, 460) :CGSizeMake( self.view.bounds.size.width, self.view.bounds.size.height * 1.2)];
    [self notification:@selector(peoHandleInfo:) :@"peoInfo" :@selector(resHandleInfo:) :@"resInfo" :@selector(comHandleInfo:) :@"comInfo" :@selector(priceHandleInfo:) :@"priceInfo"];
    [self selectorderonegroupdata:CGRectMake(15, 15, 30, 20) :16 :@"人:" :CGRectMake(20, 90, 280, 50) :18 :@"选人" :@selector(people:)];
    [self selectorderonegroupdata:CGRectMake(15, 160, 40, 20) :16 :@"餐厅:" :CGRectMake(20, 240, 280, 50) :18 :@"选餐厅" :@selector(res:)];
    [self selectorderonegroupdata:CGRectMake(15, 310, 40, 20) :16 :@"套餐:" :CGRectMake(20, 390, 280, 50) :18 :@"选套餐" :@selector(combo:)];
    [self selectorderonegrouplabelnulldata:CGRectMake(20, 40, 280, 40) :16 :NULL :CGRectMake(20, 190, 280, 40) :CGRectMake(20, 340, 280, 40)];
    [self sure:CGRectMake(20, 440, 280, 50) :18 :@"确定" :@selector(sure:)];
}
-(void) selectorderonegroupdata:(CGRect)framelabel :(double)fontsizelabel :(NSString*)titlelabel :(CGRect)framebutton :(double)fontsizebutton :(NSString*)titlebutton :(void*)action
{
    UILabel *selectorderlabel = [self createLabel:framelabel :fontsizelabel :titlelabel];
    [m_scrollView addSubview:selectorderlabel];
    UIButton *selectorderbutton = [self creatbutton:framebutton :fontsizebutton :titlebutton];
    [m_scrollView addSubview:selectorderbutton];
    [selectorderbutton addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
}
-(void) selectorderonegrouplabelnulldata:(CGRect)firstlabelnull :(double)labelnullfontsize :(NSString*)labelnulltitle :(CGRect)secondlabelnull :(CGRect)thirdlabelnull
{
    m_labelpeopleNull = [self createLabel:firstlabelnull :labelnullfontsize :labelnulltitle];
    [m_scrollView addSubview:m_labelpeopleNull];
    m_labelpeopleNull.backgroundColor = [UIColor lightGrayColor];
    m_labelresNull = [self createLabel:secondlabelnull :labelnullfontsize :labelnulltitle];
    [m_scrollView addSubview:m_labelresNull];
    m_labelresNull.backgroundColor = [UIColor lightGrayColor];
    m_labelcomboNull = [self createLabel:thirdlabelnull :labelnullfontsize :labelnulltitle];
    [m_scrollView addSubview: m_labelcomboNull];
    m_labelcomboNull.backgroundColor = [UIColor lightGrayColor];
    m_labelpriceNull = [self createLabel:thirdlabelnull :labelnullfontsize :labelnulltitle];
}
- (void)sure :(CGRect)frame :(double)fontsize :(NSString*)title :(void*)action
{
    UIButton *sure = [self creatbutton:frame :fontsize :title];
    [m_scrollView addSubview:sure];
    [sure addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
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
- (UIScrollView *)scrollView :(CGRect)frame :(CGSize)contentsize
{
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:frame];
    scrollView.contentSize = contentsize;
    scrollView.directionalLockEnabled = YES;
    [self.view addSubview:scrollView];
    scrollView.delegate = self;
    scrollView.delaysContentTouches=YES;
    return scrollView;
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
-(void)judge
{
    NSString *orderfile=[m_path stringByAppendingPathComponent:@"ordered.plist"];
    NSFileManager *ordered = [NSFileManager defaultManager];
    if (![[NSFileManager defaultManager] fileExistsAtPath:orderfile])
    {
        [ordered createFileAtPath:orderfile contents:nil attributes:nil];
        NSArray *arrorder =[[NSArray alloc]initWithObjects:m_labelpeopleNull.text, m_labelresNull.text, m_labelcomboNull.text, m_labelpriceNull.text, nil];
        NSArray *arrord = [[NSArray alloc]initWithObjects:arrorder, nil];
        [arrord writeToFile:orderfile atomically:YES];
    }
    else
    {
        NSMutableArray *arrordered = [NSArray arrayWithContentsOfFile:orderfile];
        NSArray *arradd = [[NSArray alloc]initWithObjects:m_labelpeopleNull.text, m_labelresNull.text, m_labelcomboNull.text, m_labelpriceNull.text, nil];
        [arrordered addObject:arradd];
        [arrordered writeToFile:orderfile atomically:YES];
    }
}
-(void)save
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    m_path=[paths objectAtIndex:0];
    [self judge];
    m_labelpriceNull.text = NULL;
    m_labelpeopleNull.text = NULL;
    m_labelresNull.text = NULL;
    m_labelcomboNull.text = NULL;
}
- (void)sure:(id)sender
{
    if (m_labelpeopleNull.text != NULL & m_labelpriceNull.text != NULL & m_labelcomboNull.text != NULL)
    {
        [self save];
    }
    else
    {
    UIAlertView *alert=[self creatalert:@"数据未保存"];
    [alert show];
    }
}
-(void)peoHandleInfo:(NSNotification *)notification{
    NSString *data = [notification object];
    m_labelpeopleNull.text = data;
//    NSLog(@"%@",m_labelpeopleNull.text);

}
-(void)resHandleInfo:(NSNotification *)notification{
    NSString *datar = [notification object];
    m_labelresNull.text = datar;
}
-(void)comHandleInfo:(NSNotification *)notification{
    NSString *datac = [notification object];
    m_labelcomboNull.text = datac;
}
-(void)priceHandleInfo:(NSNotification *)notification{
    NSString *datap = [notification object];
    m_labelpriceNull.text = datap;
//    NSLog(@"%@",m_labelpriceNull.text);
}
@end