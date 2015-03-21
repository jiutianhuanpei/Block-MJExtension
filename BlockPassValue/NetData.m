//
//  NetData.m
//  BlockPassValue
//
//  Created by 沈红榜 on 15/3/21.
//  Copyright (c) 2015年 Shen Hongbang. All rights reserved.
//

#import "NetData.h"
#import <AFNetworking.h>

@implementation NetData

- (void)getDataByUrl:(NSString *)urlString
{
     AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
     [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
          if (responseObject != nil) {
               
               _typeBlock(responseObject);
               
          }
     } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          NSLog(@"NETDATA’S ERROR: %@",error);
     }];
}

- (void)sendValue:(TypeBlock)block
{
     self.typeBlock = block;
}

@end
