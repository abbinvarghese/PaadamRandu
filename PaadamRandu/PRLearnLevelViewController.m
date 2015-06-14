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

@interface PRLearnLevelViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *mainMenuCollectionView;

@end

@implementation PRLearnLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mainMenuCollectionView registerClass:[PRMainMenuCells class] forCellWithReuseIdentifier:@"PRMainMenuCells"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 16;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PRMainMenuCells *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PRMainMenuCells" forIndexPath:indexPath];
    cell.layer.masksToBounds = YES;
    cell.layer.cornerRadius = 10;
    return cell;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(50, 50, 10, 50);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    PRLearnAreaViewController *controller = [[PRLearnAreaViewController alloc]initWithNibName:@"PRLearnAreaViewController" bundle:[NSBundle mainBundle]];
    [self.navigationController presentViewController:controller animated:NO completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
