//
//  Blocks.m
//  BlockPassValue
//
//  Created by 沈红榜 on 15/3/21.
//  Copyright (c) 2015年 Shen Hongbang. All rights reserved.
//

#import "Blocks.h"
#import <MJExtension.h>
#import "Content.h"

@implementation Blocks

+ (NSDictionary *)replacedKeyFromPropertyName
{
     return @{
              @"id" : @"iid",
              @"template" : @"tmplate"
              };
}

+ (NSDictionary *)objectClassInArray
{
     return @{
              @"contents" : [Content class]
              };
}


@end
