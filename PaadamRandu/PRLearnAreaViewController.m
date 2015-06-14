//
//  PRLearnAreaViewController.m
//  PaadamRandu
//
//  Created by Abbin Varghese on 14/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import "PRLearnAreaViewController.h"

@interface PRLearnAreaViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *speakButton;

@end

@implementation PRLearnAreaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.layer.cornerRadius = 10;
    self.imageView.layer.masksToBounds = YES;
    self.speakButton.imageView.image = [self.speakButton.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.speakButton.imageView setTintColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonPressed:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:nil];
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
