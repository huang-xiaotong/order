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
    CGRect frame = CGRectMake(0, 20, 320, 50);
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = frame;
    [button setTitle:@"KFC"forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    CGRect frame2 = CGRectMake(20, 240, 280, 50);
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button2.frame = frame2;
    [button2 setTitle:@"7-11"forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor clearColor];
    button2.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button2];
    CGRect frame3 = CGRectMake(20, 390, 280, 50);
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button3.frame = frame3;
    [button3 setTitle:@"成都小吃"forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor clearColor];
    button3.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button3];


	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onClick:(id)sender{
    SecondViewController *nextController = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:nextController animated:YES];
    
}
@end
