//

//  M13InfiniteTabBar
//
//  Created by Alex on 1/24/14.
//  Copyright (c) 2014 Brandon McQuilkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dish.h"

@protocol dishCellDelegate <NSObject>


-(void)dialclick:(id)sender;
@end



@interface dishCell : UITableViewCell

//@property (strong, nonatomic)id<dishCellDelegate> delegate;

@property (strong, nonatomic) IBOutlet UILabel *Name;
@property (strong, nonatomic) IBOutlet UIButton *telbtn;

@property (strong, nonatomic) IBOutlet UILabel *Address;
- (IBAction)Dial:(id)sender;

-(void)SetDish:(dish *)item;

@end
