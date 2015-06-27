//
//  PRPlayLevelViewController.m
//  PaadamRandu
//
//  Created by Abbin Varghese on 13/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import "PRPlayLevelViewController.h"
#import "PRMainMenuCells.h"
#import "PRPlayAreaMainViewController.h"
#import "PRCommon.h"
#import "NSMutableArray+PRMutableArray.h"

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
    NSArray *array = [[NSArray alloc]initWithObjects:@"Body_parts",@"Colors",@"Farm_animals",@"Foods",@"Fruits",@"House_animals",@"Household_1",@"HouseHold_2",@"Natural_items",@"Numbers",@"Objects",@"People",@"Places",@"Sea_animals",@"Spices",@"Vegetables",@"Vehicles",@"Wild_animals", nil];
    cell.imageView.image = [UIImage imageNamed:[array objectAtIndex:indexPath.row]];
    [cell initCellWithColour:[self.colorArray objectAtIndex:indexPath.row]];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    return UIEdgeInsetsMake(100, 50, 10, 50);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PRPlayAreaMainViewController *playController = [[PRPlayAreaMainViewController alloc]initWithNibName:@"PRPlayAreaMainViewController" bundle:[NSBundle mainBundle]];
    playController.view.backgroundColor = [self.colorArray objectAtIndex:indexPath.row];
    [self.navigationController presentViewController:playController animated:NO
                                          completion:nil];
}




@end
