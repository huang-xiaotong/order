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
//@synthesize listDatap;


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
    DataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 410)];
    [DataTable setDelegate:self];
    [DataTable setDataSource:self];
    [self.view addSubview:DataTable];
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
//    NSLog(@" %@",path);
    NSString *file=[path stringByAppendingPathComponent:@"ordered.plist"];
    m_arrOrdered = [[NSArray alloc]initWithContentsOfFile:file];
    NSLog(@"%@",m_arrOrdered);
	array = [[NSMutableArray alloc]initWithObjects:@"赵大",@"钱二",@"张三",@"李四",@"王五", @"赵六", nil];//创建数组
    for (int i=0; i < m_arrOrdered.count; i++) {
        [array removeObject:m_arrOrdered[i][0]];
//        NSLog(@"%@",m_arrOrdered[i][0]);
//        NSLog(@"%@",array);
    }
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

//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return m_arrOrdered.count;
    }
    if (section == 1) {
        return array.count;
    }
    return 0;
}
//每个section显示的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"1人已定";
    }
    else{
       return @"5人未定";
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
static NSString *cellIdentifier = @"cell";
   cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
if (cell == nil){
    cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    //label4 价钱
    CGRect label4Rect = CGRectMake(250, 20, 130, 20);
    label4 = [[UILabel alloc]initWithFrame:label4Rect];
    [cell.contentView addSubview:label4];
    label4.font = [UIFont boldSystemFontOfSize:16];
    //label2 餐厅
    CGRect label2Rect = CGRectMake(10, 40, 60, 20);
    label2 = [[UILabel alloc]initWithFrame:label2Rect];
    [cell.contentView addSubview:label2];
    label2.font = [UIFont boldSystemFontOfSize:12];
    //label1 people
    CGRect label1Rect = CGRectMake(10, 15, 50, 20);
    label1 = [[UILabel alloc]initWithFrame:label1Rect];
    [cell.contentView addSubview:label1];
    label1.font = [UIFont boldSystemFontOfSize:18];
    //label3 套餐
    CGRect label3Rect = CGRectMake(70, 40, 100, 20);
    label3 = [[UILabel alloc]initWithFrame:label3Rect];
    [cell.contentView addSubview:label3];
    label3.font = [UIFont boldSystemFontOfSize:12];
    
}
    if(indexPath.section == 0)
    {
//        for (int i=1; i<=m_arrOrdered.count; i++) {
//            while (indexPath.row == i)
//                NSLog(@"%d",i);
        int i = 0;
        while (i<m_arrOrdered.count) {
            if (indexPath.row == i) {
                label1.text = m_arrOrdered[i][0];
            NSLog(@"%@",label1.text);
                label2.text = m_arrOrdered[i][1];
            NSLog(@"%@",label2.text);
                label3.text = m_arrOrdered[i][2];
            NSLog(@"%@",label3.text);
                label4.text = m_arrOrdered[i][3];
            NSLog(@"%@",label4.text);
        NSString *str = label4.text;
        NSScanner *scanner = [NSScanner scannerWithString:str];
        [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
        int price;
        [scanner scanInt:&price];
        if (price > 12) {
            label4.textColor = [UIColor redColor];
        }
            }
            i++;
        }
    }
        else
            {
                NSUInteger row = [indexPath row];
                label1.text = [array objectAtIndex:row];
            }
    return cell;
}



@end
