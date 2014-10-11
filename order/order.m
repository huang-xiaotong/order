//
//  order.m
//  order
//
//  Created by xyooyy on 14-10-9.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "order.h"

@implementation order


-(void)save:(NSString*)peopletext :(NSString*)restext :(NSString*)combotext :(NSString*)pricetext
{
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *m_path=[paths objectAtIndex:0];    NSString *orderfile=[m_path stringByAppendingPathComponent:@"ordered.plist"];
    NSFileManager *ordered = [NSFileManager defaultManager];
    if (![[NSFileManager defaultManager] fileExistsAtPath:orderfile])
    {
        [ordered createFileAtPath:orderfile contents:nil attributes:nil];
        NSArray *arrorder =[[NSArray alloc]initWithObjects:peopletext, restext, combotext, pricetext, nil];
        NSArray *arrord = [[NSArray alloc]initWithObjects:arrorder, nil];
        [arrord writeToFile:orderfile atomically:YES];
    }
    else
    {
        NSMutableArray *arrordered = [NSArray arrayWithContentsOfFile:orderfile];
        NSArray *arradd = [[NSArray alloc]initWithObjects:peopletext, restext, combotext, pricetext, nil];
        [arrordered addObject:arradd];
        [arrordered writeToFile:orderfile atomically:YES];
    }
}
@end

