//
//  dishModel.h
//  M13InfiniteTabBar
//
//  Created by Alex on 1/25/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "JSONModel.h"
#import "dish.h"

@interface dishModel : JSONModel
@property (strong, nonatomic) NSArray <ConvertOnDemand,dish>*dintaifung;

@end
