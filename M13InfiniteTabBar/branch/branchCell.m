//
//  branchCell.m
//  M13InfiniteTabBar
//
//  Created by Alex on 1/24/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import "branchCell.h"

@implementation branchCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)SetBranch:(branch *)item
{
 //   NSLog(@"%@",item.title);
    _Name.text=item.title;
    _Address.text=item.description;
    [_telbtn setTitle:item.subtitle forState:UIControlStateNormal] ;
    
}

- (IBAction)Dial:(id)sender {
    
    [self.delegate dialclick:sender];
}
@end
