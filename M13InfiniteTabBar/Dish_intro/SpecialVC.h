//
//  GRKViewController.h
//  GRKPageViewController
//
//  Created by Levi Brown on 11/18/13.
//  Copyright (c) 2013 Levi Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRKPageViewController.h"
#import "specialModel.h"
@interface SpecialVC : UIViewController <GRKPageViewControllerDataSource, GRKPageViewControllerDelegate>
@property (strong, nonatomic) specialModel  *specialModel;

@end
