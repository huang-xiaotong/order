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

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"订单显示";
    [self datatable];
    [self getdata];
	m_arrpeople = [[NSMutableArray alloc]initWithObjects:@"赵大",@"钱二",@"张三",@"李四",@"王五", @"赵六", nil];//创建数组
    for (int i=0; i < m_arrOrdered.count; i++) {
        [m_arrpeople removeObject:m_arrOrdered[i][0]];
    }
}
-(void)datatable
{
    UITableView *DataTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 416)];
    [DataTable setDelegate:self];
    [DataTable setDataSource:self];
    [self.view addSubview:DataTable];
}
-(void)getdata
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths objectAtIndex:0];
    NSString *file=[path stringByAppendingPathComponent:@"ordered.plist"];
    m_arrOrdered = [[NSArray alloc]initWithContentsOfFile:file];
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
//指定有多少个分区(Section)，默认为1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) 
        return m_arrOrdered.count;
    if (section == 1) 
        return m_arrpeople.count;
    return 0;
}
//每个section显示的标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        int n = 6 - m_arrpeople.count;
        return [NSString stringWithFormat:@"%d人已定",n];
    }
    else {
        int m = m_arrpeople.count;
        return [NSString stringWithFormat:@"%d人未定",m];
    }
}
- (UILabel *)createCellLabel:(CGRect)frame :(double)fontSize
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont boldSystemFontOfSize:fontSize];
    return label;
}
- (void) ordershow :(int)i
{
    m_labelpeople.text = m_arrOrdered[i][0];
    m_labelres.text = m_arrOrdered[i][1];
    m_labelcombo.text = m_arrOrdered[i][2];
    m_labelprice.text = m_arrOrdered[i][3];
    NSString *str = m_labelprice.text;
    NSScanner *scanner = [NSScanner scannerWithString:str];
    [scanner scanUpToCharactersFromSet:[NSCharacterSet decimalDigitCharacterSet] intoString:nil];
    int price;
    [scanner scanInt:&price];
    if (price > 12) {
        m_labelprice.textColor = [UIColor redColor];
    }
}
-(void)tableviewcelllabel
{
    //tableviewcell label labelprice:价格 labelres:餐厅 labelpeople:人 labelcombo:套餐
    m_labelprice = [self createCellLabel:CGRectMake(250, 20, 130, 20) :16];
    [m_cell.contentView addSubview:m_labelprice];
    m_labelres = [self createCellLabel:CGRectMake(10, 40, 60, 20) :12];
    [m_cell.contentView addSubview:m_labelres];
    m_labelpeople = [self createCellLabel:CGRectMake(10, 15, 50, 20) :18];
    [m_cell.contentView addSubview:m_labelpeople];
    m_labelcombo = [self createCellLabel:CGRectMake(70, 40, 100, 20) :12];
    [m_cell.contentView addSubview:m_labelcombo];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    m_cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (m_cell == nil)
    {
        m_cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    [self tableviewcelllabel];
    if(indexPath.section == 0)
    {
        int i = 0;
        while (i<m_arrOrdered.count) {
            if (indexPath.row == i) {
                [self ordershow:i];
            }
            i++;
        }
    }
    else
    {
        NSUInteger row = [indexPath row];
        m_labelpeople.text = [m_arrpeople objectAtIndex:row];
    }
    return m_cell;
}
@end
