//
//  PRPlayAreaMainViewController.h
//  PaadamRandu
//
//  Created by Abbin Varghese on 13/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PRPlayAreaMainViewController;

@protocol PRPlayAreaMainViewDelegate <NSObject>

-(void)PRPlayAreaMainViewControllerDidClickOnBackButton:(PRPlayAreaMainViewController*)controller;

@end

@interface PRPlayAreaMainViewController : UIViewController

@property(nonatomic,weak) id <PRPlayAreaMainViewDelegate> delegate;
@property(nonatomic,strong) UIColor *viewColor;

@end
