//
//  ordViewController.m
//  order
//
//  Created by xyooyy on 14-9-18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "ordViewController.h"
#import "peopleViewController.h"

@interface ordViewController ()

@end

@implementation ordViewController

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
    self.title = @"订单显示";
    DataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 330)];
    [DataTable setDelegate:self];
    [DataTable setDataSource:self];
    [self.view addSubview:DataTable];
    
    NSNotificationCenter *center2 = [NSNotificationCenter defaultCenter];//取得NSNotification对象
    [center2 addObserver:self selector:@selector(peoHandleInfo:) name:@"logInfo" object:nil];//注册自己为监听者，当有消息过来
    [center2 addObserver:self selector:@selector(resHandleInfo:) name:@"resInfo" object:nil];
    [center2 addObserver:self selector:@selector(comHandleInfo:) name:@"comInfo" object:nil];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -
#pragma mark Table View Data Soure Methods
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    return TitleData;
//}
// Section Titles
//每个section显示的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"3人已定";
    return @"3人未定";
}
//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *cellIdentifier = @"cell";
   cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
if (cell == nil){
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    CGRect labelRect = CGRectMake(250, 10, 130, 20);
    label = [[UILabel alloc]initWithFrame:labelRect];
    [cell.contentView addSubview:label];
    label.font = [UIFont boldSystemFontOfSize:16];
}
    return cell;
}
-(void)peoHandleInfo:(NSNotification *)notification{
    datap = [notification object];
    cell.textLabel.text = datap;
    NSLog(@" %@",cell.textLabel.text);
}
-(void)resHandleInfo:(NSNotification *)notification{
    datar = [notification object];
    cell.detailTextLabel.text = datar;
    NSLog(@" %@",datar);
}
-(void)comHandleInfo:(NSNotification *)notification{
    datac = [notification object];
    label.text = datac;
    NSLog(@" %@", datac);
}

@end
