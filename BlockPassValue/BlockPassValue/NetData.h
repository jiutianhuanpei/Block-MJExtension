//
//  NetData.h
//  BlockPassValue
//
//  Created by 沈红榜 on 15/3/21.
//  Copyright (c) 2015年 Shen Hongbang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^TypeBlock)(id data);

@interface NetData : NSObject

@property (nonatomic, copy) TypeBlock typeBlock;

- (void)getDataByUrl:(NSString *)urlString;

- (void)sendValue:(TypeBlock)block;

@end
