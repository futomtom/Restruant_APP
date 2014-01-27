//
//  branchModel.h
//  M13InfiniteTabBar
//
//  Created by Alex on 1/24/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "JSONModel.h"
@protocol branch @end

@interface branch : JSONModel

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* subtitle;
@property (strong, nonatomic) NSString* description;



@end
