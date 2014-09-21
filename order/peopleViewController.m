//
//  peopleViewController.m
//  order
//
//  Created by xyooyy on 14-9-18.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "peopleViewController.h"
#import "SecondViewController.h"

@interface peopleViewController ()

@end

@implementation peopleViewController

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
    //定义nsnotification 
    
    //button 赵大
    CGRect frame = CGRectMake(0, 20, 320, 50);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:@"赵大"forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    //button 钱二
    CGRect frame2 = CGRectMake(0, 70, 320, 50);
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = frame2;
    [button2 setTitle:@"钱二"forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor clearColor];
    button2.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button2];
    //button 张三
    CGRect frame3 = CGRectMake(0, 120, 320, 50);
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = frame3;
    [button3 setTitle:@"张三"forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor clearColor];
    button3.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button3];
    //button 李四
    CGRect frame4 = CGRectMake(0, 170, 320, 50);
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button4.frame = frame4;
    [button4 setTitle:@"李四"forState:UIControlStateNormal];
    button4.backgroundColor = [UIColor clearColor];
    button4.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button4];
    [button4 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    //button 王五
    CGRect frame5 = CGRectMake(0, 220, 320, 50);
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button5.frame = frame5;
    [button5 setTitle:@"王五"forState:UIControlStateNormal];
    button5.backgroundColor = [UIColor clearColor];
    button5.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button5];
    //button 赵六
    CGRect frame6 = CGRectMake(0, 270, 320, 50);
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button6.frame = frame6;
    [button6 setTitle:@"赵六"forState:UIControlStateNormal];
    button6.backgroundColor = [UIColor clearColor];
    button6.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button6];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onClick:(id)sender
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(GetInfo:) name:@"logInfo" object:nil];//注册自己为监听者observer
    //    [center removeObserver:self];
    [center postNotificationName:@"logInfo" object:@"李四"];//注册自己为发送者并发送信息
    SecondViewController *nextController = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:nextController animated:YES];
}
-(void) GetInfo:(NSNotification *) notificaion{
    //取得接受数据并打印
    NSString *data = [notificaion object];
        NSLog(@">> %@",data);
}
@end
