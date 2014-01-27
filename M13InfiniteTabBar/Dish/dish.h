//
//  dish.h
//  M13InfiniteTabBar
//
//  Created by Alex on 1/25/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "JSONModel.h"
@protocol dish @end
@interface dish : JSONModel

@property (strong, nonatomic) NSString* menu1;
@property (strong, nonatomic) NSString* menu2;
@property (strong, nonatomic) NSString* menu2_id;
@property (strong, nonatomic) NSString* menu1_foreign;


@end
