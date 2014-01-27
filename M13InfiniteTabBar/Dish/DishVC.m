//
//  BranchVC.m
//  M13InfiniteTabBar
//
//  Created by Alex on 1/24/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "DishVC.h"
#import "branch.h"
#import "dishCell.h"

@interface DishVC ()

@end

@implementation DishVC



- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.tableView registerClass:[branchCell class] forCellReuseIdentifier:@"cell"];
    [self loadFromDisk];
	// Do any additional setup after loading the view.
}

-(void)loadFromDisk{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"dishes" ofType:@"json"];
   
    NSString *jsonContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSError* err;
    _dishModel = [[dishModel alloc] initWithString: jsonContents error:&err];
    NSLog(@"%@",[err localizedDescription]);
    
                           
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%d",_dishModel.dintaifung.count);
    return _dishModel.dintaifung.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    dishCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
   
    [cell SetDish:_dishModel.dintaifung[indexPath.row]];
    
    return cell;
    
}

/*
-(void)dialclick:(id)sender
{
    dishCell *cell=(dishCell*)sender;
     NSIndexPath *IndexPath = [self.tableView indexPathForCell:cell];
    dish *selected=_dishModel.dintaifung[IndexPath.row];
    NSString *phoneNumber = [NSString stringWithFormat:@"%@%@", @"tel://",selectedBranch.subtitle];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber
                                                ]];

    
}
 */



@end
