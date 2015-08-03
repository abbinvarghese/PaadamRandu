//
//  PRLearnAreaViewController.m
//  PaadamRandu
//
//  Created by Abbin Varghese on 14/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import "PRLearnAreaViewController.h"
#import "PRAnimatedButton.h"
#import "PRLearnAreaCollectionViewCell.h"
#import "Objects.h"

@interface PRLearnAreaViewController ()

@property (weak, nonatomic) IBOutlet PRAnimatedButton *speakButton;
@property (nonatomic,strong) NSArray *levelItems;
@property (weak, nonatomic) IBOutlet UICollectionView *learnAreaCollectionView;

@end

@implementation PRLearnAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.levelItems = [[CLCoreDataHelper sharedCLCoreDataHelper]getAllLevelItemsForLevel:self.level];
    [self.learnAreaCollectionView registerClass:[PRLearnAreaCollectionViewCell class] forCellWithReuseIdentifier:@"PRLearnAreaCollectionViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)didClickSpeakButton:(PRAnimatedButton *)sender {
    
    //This Button Click calls the delegate method "PRLearnAreaDidTapSpeakButton" in "PRLearnAreaCollectionViewCell" to play the required sound.
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(PRLearnAreaDidTapSpeakButton:)]){
        [self.delegate PRLearnAreaDidTapSpeakButton:self];
    }
}

#pragma mark-
#pragma mark UICollectionView Delegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.levelItems count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PRLearnAreaCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PRLearnAreaCollectionViewCell" forIndexPath:indexPath];
    cell.index = indexPath.row;
    Objects *obj = [self.levelItems objectAtIndex:indexPath.row];
    [cell initCellWithImage:[UIImage imageNamed:obj.name] andVoice:obj.name];
    self.delegate = cell;
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(PRLearnAreaCollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    [cell deallocVoiceFile];
}



@end
