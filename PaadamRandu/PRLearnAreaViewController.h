//
//  PRLearnAreaViewController.h
//  PaadamRandu
//
//  Created by Abbin Varghese on 14/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRLearnAreaViewController;

@protocol PRLearnAreaSpeakDelegate <NSObject>

-(void)PRLearnAreaDidTapSpeakButton:(PRLearnAreaViewController*) LearnArea;

@end

@interface PRLearnAreaViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) NSString *level;

@property(nonatomic,weak) id <PRLearnAreaSpeakDelegate> delegate;

@end
