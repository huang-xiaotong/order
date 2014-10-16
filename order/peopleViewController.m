//
//  peopleViewController.m
//  order
//
//  Created by xyooyy on 14-9-18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "peopleViewController.h"
#import "SelectOrderViewController.h"
@interface peopleViewController ()

@end

@implementation peopleViewController
@synthesize m_listDatap;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    m_pTableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:m_pTableView];
    m_pTableView.delegate = self;
    m_pTableView.dataSource = self;
    NSArray *arraypeople = [[NSArray alloc]initWithObjects:@"赵大",@"钱二",@"张三",@"李四",@"王五", @"赵六", nil];//创建数组
    self.m_listDatap = arraypeople;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60.0f;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark -
#pragma mark Table View Data Soure Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.m_listDatap count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [m_listDatap objectAtIndex:row];
    cell.textLabel.textColor = [UIColor blueColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = [indexPath row];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center postNotificationName:@"peoInfo" object:[m_listDatap objectAtIndex:row]];//注册自己为发送者并发送信息
    [self.navigationController popViewControllerAnimated:YES];
}
@end
