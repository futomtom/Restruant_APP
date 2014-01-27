//
//  AppDelegate.m
//  M13InfiniteTabBar
//
//  Created by Brandon McQuilkin on 2/13/13.
//  Copyright (c) 2013 Brandon McQuilkin. All rights reserved.
//

#import "AppDelegate.h"

#import "M13InfiniteTabBarController.h"
#import "M13InfiniteTabBarItem.h"
#import "PulsingRequiresAttentionView.h"
#import "ViewController.h"
#import "BrandVC.h"
#import "BranchVC.h"
#import "DishVC.h"
#import "NewsViewController.h"
#import "SpecialVC.h"


@interface AppDelegate () <M13InfiniteTabBarControllerDelegate>

@end

@implementation AppDelegate
{
    GRKPageViewController  *brand_tintro;
    BranchVC *branchVC;
    DishVC *dishVC;
    NewsViewController *newsVC;
    SpecialVC *specialVC;
    ViewController *c6;
    ViewController *c7;
    ViewController *c8;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Create view controllers
    
    UIStoryboard * brandStroyboard = [UIStoryboard storyboardWithName:@"Brand" bundle:nil];
    brand_tintro = [brandStroyboard instantiateViewControllerWithIdentifier:@"brand"];
    
  //  brand_tintro.title = @"品牌介紹";
    
    
    UIStoryboard * branchStroyboard = [UIStoryboard storyboardWithName:@"branch" bundle:nil];
    branchVC = [branchStroyboard instantiateViewControllerWithIdentifier:@"branch"];
   
 //   branch_intro.title = @"分店資訊 ";
   
    UIStoryboard * dishStroyboard = [UIStoryboard storyboardWithName:@"dish" bundle:nil];
    dishVC = [dishStroyboard instantiateViewControllerWithIdentifier:@"dish"];
    
    newsVC = [[NewsViewController alloc] init];
    
    UIStoryboard * dish_introStroyboard = [UIStoryboard storyboardWithName:@"Dish_intro" bundle:nil];
    specialVC = [dish_introStroyboard instantiateViewControllerWithIdentifier:@"special"];

    c6 = [[ViewController alloc] init];
    c6.view.backgroundColor = [UIColor lightGrayColor];
    c6.title = @"Cloud";
    UIView *sub6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    sub6.backgroundColor = [UIColor whiteColor];
    [c6.view addSubview:sub6];
    
    
    c8 = [[ViewController alloc] init];
    c8.view.backgroundColor = [UIColor purpleColor];
    c8.title = @"Info";
    UIView *sub8 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 5, 5)];
    sub8.backgroundColor = [UIColor whiteColor];
    [c8.view addSubview:sub8];
    UINavigationController *n7 = [[UINavigationController alloc] initWithRootViewController:c7];
    [n7 pushViewController:c8 animated:NO];
    
    //Create Tab bar items
    M13InfiniteTabBarItem *i1 = [[M13InfiniteTabBarItem alloc] initWithTitle:@"品牌介紹" selectedIconMask:[UIImage imageNamed:@"tab1Solid.png"] unselectedIconMask:[UIImage imageNamed:@"tab1Line.png"]];
    M13InfiniteTabBarItem *i2 = [[M13InfiniteTabBarItem alloc] initWithTitle:@"分店資訊" selectedIconMask:[UIImage imageNamed:@"tab2Solid.png"] unselectedIconMask:[UIImage imageNamed:@"tab2Line.png"]];
    M13InfiniteTabBarItem *i3 = [[M13InfiniteTabBarItem alloc] initWithTitle:@"佳餚美食" selectedIconMask:[UIImage imageNamed:@"tab3Solid.png"] unselectedIconMask:[UIImage imageNamed:@"tab3Line.png"]];
    M13InfiniteTabBarItem *i4 = [[M13InfiniteTabBarItem alloc] initWithTitle:@"最新消息" selectedIconMask:[UIImage imageNamed:@"tab4Solid.png"] unselectedIconMask:[UIImage imageNamed:@"tab4Line.png"]];
    M13InfiniteTabBarItem *i5 = [[M13InfiniteTabBarItem alloc] initWithTitle:@"首選推薦" selectedIconMask:[UIImage imageNamed:@"tab5Solid.png"] unselectedIconMask:[UIImage imageNamed:@"tab5Line.png"]];
    M13InfiniteTabBarItem *i6 = [[M13InfiniteTabBarItem alloc] initWithTitle:@"影音連結" selectedIconMask:[UIImage imageNamed:@"tab6Solid.png"] unselectedIconMask:[UIImage imageNamed:@"tab6Line.png"]];
    M13InfiniteTabBarItem *i7 = [[M13InfiniteTabBarItem alloc] initWithTitle:@"快速播號" selectedIconMask:[UIImage imageNamed:@"tab7Solid.png"] unselectedIconMask:[UIImage imageNamed:@"tab7Line.png"]];
    
    //Create View Controller
    M13InfiniteTabBarController *viewController = [[M13InfiniteTabBarController alloc] initWithViewControllers:@[branchVC,dishVC,brand_tintro,newsVC,specialVC,c6,branchVC] pairedWithInfiniteTabBarItems:@[i2,i3,i1,i4,i5,i6,i7]];
    viewController.delegate = self;
    
    //Set the requires user attention background
    viewController.requiresAttentionBackgroundView = [[PulsingRequiresAttentionView alloc] init];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = viewController;
    [self.window makeKeyAndVisible];
    
    //A view controller requires user attention
 //   [viewController viewControllerAtIndex:1 requiresUserAttentionWithImportanceLevel:1];
    
    return YES;
}

//Delegate Protocol
- (BOOL)infiniteTabBarController:(M13InfiniteTabBarController *)tabBarController shouldSelectViewContoller:(UIViewController *)viewController
{
 /*   if (viewController == c1) { //Prevent selection of first view controller
        return NO;
    } else
  */
    {
        return YES;
    }
}

- (void)infiniteTabBarController:(M13InfiniteTabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    //Do nothing
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
