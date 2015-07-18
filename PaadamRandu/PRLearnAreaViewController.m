//
//  PRLearnAreaViewController.m
//  PaadamRandu
//
//  Created by Abbin Varghese on 14/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import "PRLearnAreaViewController.h"
#import "PRAnimatedButton.h"

@interface PRLearnAreaViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet PRAnimatedButton *speakButton;

@end

@implementation PRLearnAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.layer.cornerRadius = 10;
    self.imageView.layer.masksToBounds = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (IBAction)didClickSpeakButton:(PRAnimatedButton *)sender {
    
}


@end
