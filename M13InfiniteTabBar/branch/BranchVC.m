//
//  BranchVC.m
//  M13InfiniteTabBar
//
//  Created by Alex on 1/24/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "BranchVC.h"
#import "branch.h"
#import "branchCell.h"

@interface BranchVC ()

@end

@implementation BranchVC



- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.tableView registerClass:[branchCell class] forCellReuseIdentifier:@"cell"];
    [self loadFromDisk];
	// Do any additional setup after loading the view.
}

-(void)loadFromDisk{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"branch" ofType:@"json"];
   
    NSString *jsonContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSError* err;
    _BranchModel = [[branchModel alloc] initWithString: jsonContents error:&err];
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
    NSLog(@"%d",_BranchModel.dintaifung.count);
    return _BranchModel.dintaifung.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    branchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.delegate=self;
    [cell SetBranch:_BranchModel.dintaifung[indexPath.row]];
    
    return cell;
    
}

-(void)dialclick:(id)sender
{
    branchCell *cell=(branchCell*)sender;
     NSIndexPath *IndexPath = [self.tableView indexPathForCell:cell];
    branch *selectedBranch=_BranchModel.dintaifung[IndexPath.row];
    NSString *phoneNumber = [NSString stringWithFormat:@"%@%@", @"tel://",selectedBranch.subtitle];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber
                                                ]];

    
}



@end
