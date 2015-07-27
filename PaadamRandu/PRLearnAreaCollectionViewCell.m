//
//  PRLearnAreaCollectionViewCell.m
//  PaadamRandu
//
//  Created by Abbin on 27/07/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import "PRLearnAreaCollectionViewCell.h"

@implementation PRLearnAreaCollectionViewCell

- (void)awakeFromNib {
    
}

- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        // Initialization code
        NSArray *arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"PRLearnAreaCollectionViewCell" owner:self options:nil];
        
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        
    }
    [self initCell];
    return self;
    
}

-(void)initCell{
    self.itemView.layer.masksToBounds = YES;
    self.itemView.layer.cornerRadius = 10;
}

#pragma mark-
#pragma mark PRLearnAreaSpeakDelegate

-(void)PRLearnAreaDidTapSpeakButton:(PRLearnAreaViewController *)LearnArea{
    NSLog(@"PEW PEW!!");
}

@end
