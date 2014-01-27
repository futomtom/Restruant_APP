//
//  GRKViewController.m
//  GRKPageViewController
//
//  Created by Levi Brown on 11/18/13.
//  Copyright (c) 2013 Levi Brown. All rights reserved.
//

#import "SpecialVC.h"
#import "IntroPageVC.h"
#import "special.h"

@interface SpecialVC ()

@property (nonatomic,weak) GRKPageViewController *pageViewController;
@property (nonatomic,weak) IBOutlet UISwitch *animatedSwitch;
@property (nonatomic,weak) IBOutlet UIPageControl *pageControl;

- (IBAction)buttonAction:(UIButton *)button;
- (IBAction)pageControlAction;

@end

@implementation SpecialVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self.tableView registerClass:[branchCell class] forCellReuseIdentifier:@"cell"];
    [self loadFromDisk];
	// Do any additional setup after loading the view.
}

-(void)loadFromDisk{
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Special" ofType:@"json"];
    
    NSString *jsonContents = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSError* err;
    _specialModel = [[specialModel alloc] initWithString: jsonContents error:&err];
    NSLog(@"%@",[err localizedDescription]);
    
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UIViewController *dest = segue.destinationViewController;
    if ([dest isKindOfClass:GRKPageViewController.class])
    {
        self.pageViewController = (GRKPageViewController *)dest;
        self.pageViewController.dataSource = self;
        self.pageViewController.delegate = self;
        [self.pageViewController setCurrentIndex:1 animated:NO];
        self.pageControl.numberOfPages = [self pageCount];
        self.pageControl.currentPage = self.pageViewController.currentIndex;
    }
}

#pragma mark - Actions

- (IBAction)buttonAction:(UIButton *)button
{
    [self.pageViewController setCurrentIndex:button.tag animated:self.animatedSwitch.on];
}

- (IBAction)pageControlAction
{
    NSInteger currentPage = self.pageControl.currentPage;
    [self.pageViewController setCurrentIndex:(NSUInteger)currentPage animated:self.animatedSwitch.on];
}

#pragma mark - GRKPageViewControllerDataSource

- (NSUInteger)pageCount
{
    return _specialModel.dintaifung.count;
}

- (UIViewController *)viewControllerForIndex:(NSUInteger)index
{
   
    UIStoryboard * brandStroyboard = [UIStoryboard storyboardWithName:@"Brand" bundle:nil];
    IntroPageVC *PageVC = [brandStroyboard instantiateViewControllerWithIdentifier:@"page"];
    
       
    special *specialItem=_specialModel.dintaifung[index];
    UIImage *image=[UIImage imageNamed:specialItem.image_filepath];
  //  NSLog(@"%@",specialItem.image_filepath);
    
  //   NSLog(@"%@",specialItem.description);
      dispatch_async(dispatch_get_main_queue(), ^{
        [PageVC.IntroTxt setText:specialItem.description];
        [PageVC.IntroimageV setImage:image];
    });
    
    return PageVC;
}

#pragma mark - GRKPageViewControllerDelegate

- (void)changedIndexOffset:(CGFloat)indexOffset forPageViewController:(GRKPageViewController *)controller
{
    NSLog(@"Index Offset: %f", indexOffset);
}

- (void)changedIndex:(NSUInteger)index forPageViewController:(GRKPageViewController *)controller
{
    NSLog(@"Current Index: %lu", (unsigned long)index);
    self.pageControl.currentPage = index;
}

@end
