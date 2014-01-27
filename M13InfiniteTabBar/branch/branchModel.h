//
//  branchModel.h
//  M13InfiniteTabBar
//
//  Created by Alex on 1/25/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "JSONModel.h"
#import "branch.h"

@protocol branchModel @end

@interface branchModel : JSONModel
@property (strong, nonatomic) NSArray <ConvertOnDemand,branch>*dintaifung;


@end
