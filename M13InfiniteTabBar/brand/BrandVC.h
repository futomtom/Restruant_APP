//
//  GRKViewController.h
//  GRKPageViewController
//
//  Created by Levi Brown on 11/18/13.
//  Copyright (c) 2013 Levi Brown. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GRKPageViewController.h"
#import "brandModel.h"

@interface BrandVC : UIViewController <GRKPageViewControllerDataSource, GRKPageViewControllerDelegate>
@property (strong, nonatomic) brandModel  *brandModel;

@end
