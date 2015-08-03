//
//  PRLearnAreaCollectionViewCell.h
//  PaadamRandu
//
//  Created by Abbin on 27/07/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRLearnAreaViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface PRLearnAreaCollectionViewCell : UICollectionViewCell<PRLearnAreaSpeakDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UIView *itemView;
@property (nonatomic, strong) NSString *voiceName;

-(void)initCellWithImage:(UIImage*)image andVoice:(NSString*)voiceName;

@end
