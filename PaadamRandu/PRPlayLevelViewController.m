//
//  PRPlayLevelViewController.m
//  PaadamRandu
//
//  Created by Abbin Varghese on 13/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import "PRPlayLevelViewController.h"
#import "PRMainMenuCells.h"
#import "PRCommon.h"
#import "NSMutableArray+PRMutableArray.h"
#import "AppDelegate.h"
#import <pop/POP.h>

@interface PRPlayLevelViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *mainMenuCollectionView;
@property (nonatomic,retain) NSMutableArray *colorArray;
@end

@implementation PRPlayLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colorArray = [[NSMutableArray alloc]initWithObjects:color_1,color_2,color_3,color_4,color_5,color_6,color_7,color_8,color_9,color_10,color_11,color_12,color_13,color_14,color_15,color_16,color_17,color_18, nil];
    self.navigationController.navigationBarHidden = YES;
    [self.mainMenuCollectionView registerClass:[PRMainMenuCells class] forCellWithReuseIdentifier:@"PRMainMenuCells"];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.colorArray shuffle];
    [self.mainMenuCollectionView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 18;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PRMainMenuCells *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PRMainMenuCells" forIndexPath:indexPath];
    NSArray *array = [[NSArray alloc]initWithObjects:@"Bodyparts",@"Colors",@"Farmanimals",@"Foods",@"Fruits",@"Houseanimals",@"Household1",@"HouseHold2",@"Naturalitems",@"Numbers",@"Objects",@"People",@"Places",@"Seaanimals",@"Spices",@"Vegetables",@"Vehicles",@"Wildanimals", nil];
    //cell.imageView.image = [UIImage imageNamed:[array objectAtIndex:indexPath.row]];
    //[cell initCellWithColour:[self.colorArray objectAtIndex:indexPath.row]];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(100, 50, 10, 50);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PRPlayAreaMainViewController *playController = [[PRPlayAreaMainViewController alloc]initWithNibName:@"PRPlayAreaMainViewController" bundle:[NSBundle mainBundle]];
    playController.delegate = self;
    playController.viewColor = [self.colorArray objectAtIndex:indexPath.row];
    playController.providesPresentationContextTransitionStyle = YES;
    playController.definesPresentationContext = YES;
    playController.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:playController animated:NO completion:^(){
        [self viewShirnk];
        [self.tabBarController.tabBar setHidden:YES];
    }];
    
    
    
    
}

-(void)PRPlayAreaMainViewControllerDidClickOnBackButton:(PRPlayAreaMainViewController *)controller{
    [self.tabBarController.tabBar setHidden:NO];
    [self viewExpand];
}

-(void)viewShirnk{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    scaleAnimation.duration = 0.1;
    scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
    [self.view pop_addAnimation:scaleAnimation forKey:@"scalingUp"];
}

-(void)viewExpand{

        POPSpringAnimation *sprintAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        sprintAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        sprintAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
        sprintAnimation.springBounciness = 10.f;
        [self.view pop_addAnimation:sprintAnimation forKey:@"springAnimation"];

}

-(BOOL)viewDidExpandWhenAppMinimised{
    if (self.view.frame.size.height == self.view.window.frame.size.height || self.view.frame.size.width == self.view.window.frame.size.width) {
        return YES;
    }
    else{
        return NO;
    }
}





@end
