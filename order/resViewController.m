//
//  resViewController.m
//  order
//
//  Created by xyooyy on 14-9-18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "resViewController.h"
#import "SecondViewController.h"
@interface resViewController ()

@end

@implementation resViewController
@synthesize m_listDatar;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
       m_rTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, 320, 180)];
    [self.view addSubview:m_rTableView];
    m_rTableView.delegate = self;
    m_rTableView.dataSource = self;
    NSArray *arrayr = [[NSArray alloc]initWithObjects:@"KFC",@"7-11",@"成都小吃", nil];//创建数组
    self.m_listDatar = arrayr;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark Table View Data Soure Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.m_listDatar count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [m_listDatar objectAtIndex:row];
    cell.textLabel.textColor = [UIColor blueColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"resInfo" object:[m_listDatar objectAtIndex:row]];//注册自己为发送者并发送信息
    [self.navigationController popViewControllerAnimated:YES];
}
@end
