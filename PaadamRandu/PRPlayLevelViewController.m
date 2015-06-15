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

@interface PRPlayLevelViewController ()
@property (weak, nonatomic) IBOutlet UICollectionView *mainMenuCollectionView;

@end

@implementation PRPlayLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"#@#");
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
    PRPlayAreaMainViewController *playController = [[PRPlayAreaMainViewController alloc]initWithNibName:@"PRPlayAreaMainViewController" bundle:[NSBundle mainBundle]];
    //     playController.transitioningDelegate = self;
    //    playController.modalPresentationStyle = UIModalPresentationCustom;
    [self.navigationController presentViewController:playController animated:NO
                                          completion:nil];
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
