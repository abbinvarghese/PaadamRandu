//
//  PRLearnLevelViewController.m
//  PaadamRandu
//
//  Created by Abbin Varghese on 14/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import "PRLearnLevelViewController.h"
#import "PRMainMenuCells.h"
#import "PRLearnAreaViewController.h"
#import "PRCommon.h"
#import "NSMutableArray+PRMutableArray.h"
#import "Levels.h"

@interface PRLearnLevelViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *mainMenuCollectionView;
@property (nonatomic,retain) NSMutableArray *colorArray;
@property (nonatomic,strong) NSArray *levelArray;
@end

@implementation PRLearnLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.levelArray = [[CLCoreDataHelper sharedCLCoreDataHelper]getAllLevels];
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
    return [self.levelArray count];;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PRMainMenuCells *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PRMainMenuCells" forIndexPath:indexPath];
    Levels *levelObj = [self.levelArray objectAtIndex:indexPath.row];
    [cell initCellWithColour:[self.colorArray objectAtIndex:indexPath.row]
                       image:[UIImage imageNamed:levelObj.levelName]
                    andTitle:levelObj.levelName];
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(100, 50, 10, 50);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PRLearnAreaViewController *controller = [[PRLearnAreaViewController alloc]initWithNibName:@"PRLearnAreaViewController" bundle:[NSBundle mainBundle]];
    Levels *levelObj = [self.levelArray objectAtIndex:indexPath.row];
    controller.level = levelObj.levelName;
    controller.view.backgroundColor = [self.colorArray objectAtIndex:indexPath.row];
    [self.navigationController presentViewController:controller animated:NO completion:nil];
}




@end
