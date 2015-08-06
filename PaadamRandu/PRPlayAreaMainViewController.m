//
//  PRPlayAreaMainViewController.m
//  PaadamRandu
//
//  Created by Abbin Varghese on 13/06/15.
//  Copyright (c) 2015 Abbin Varghese. All rights reserved.
//

#import "PRPlayAreaMainViewController.h"
#import <pop/POP.h>
#import "FLAnimatedImage.h"
#import "NSMutableArray+PRMutableArray.h"
#import "Objects.h"


@interface PRPlayAreaMainViewController ()

@property (weak, nonatomic) IBOutlet UIView *viewOne;
@property (weak, nonatomic) IBOutlet UIView *viewTwo;
@property (weak, nonatomic) IBOutlet UIView *viewThree;
@property (weak, nonatomic) IBOutlet UIView *viewFour;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewOne;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewTwo;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewThree;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewFour;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(nonatomic,strong) NSMutableArray *levelItems;
@property(nonatomic,strong) NSString *levelName;
@property (nonatomic, strong) FLAnimatedImageView *loader;


@end

@implementation PRPlayAreaMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpViewsForAnimationStart];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self showLoader];
    [self waitForSomeTime];
}

-(void)viewDidDisappear:(BOOL)animated{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButtonClicked:(UIButton *)sender {
    [self dismissViewControllerAnimated:NO completion:^(){
        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(PRPlayAreaMainViewControllerDidClickOnBackButton:)]){
            [self.delegate PRPlayAreaMainViewControllerDidClickOnBackButton:self];
        }
    }];
}

-(void)showLoader{
    if (!self.loader) {
        self.loader = [[FLAnimatedImageView alloc] init];
        self.loader.contentMode = UIViewContentModeScaleAspectFill;
        self.loader.clipsToBounds = YES;
    }
    [self.view addSubview:self.loader];
    
    self.loader.frame = CGRectMake(0.0, 0.0, 150, 150);
    self.loader.center = CGPointMake(self.view.frame.size.width  / 2,
                                     self.view.frame.size.height / 2);
    self.loader.layer.masksToBounds = YES;
    self.loader.layer.cornerRadius = 10;
    NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"Loader" withExtension:@"gif"];
    NSData *data1 = [NSData dataWithContentsOfURL:url1];
    FLAnimatedImage *animatedImage1 = [FLAnimatedImage animatedImageWithGIFData:data1];
    self.loader.animatedImage = animatedImage1;
}

-(void)waitForSomeTime{
    float low_bound = 2;
    float high_bound = 4;
    float rndValue = (((float)arc4random()/0x100000000)*(high_bound-low_bound)+low_bound);
    [NSTimer scheduledTimerWithTimeInterval:rndValue target:self selector:@selector(stopAnimatingRemoveLoaderAndShowOptions) userInfo:nil repeats:NO];
}

-(void)stopAnimatingRemoveLoaderAndShowOptions{
     // Stops the Animation
    
    
    //Hides the loader
    //*************************
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    scaleAnimation.duration = 0.3;
    scaleAnimation.toValue = @(0);
    [self.loader pop_addAnimation:scaleAnimation forKey:@"scalingDown"];
    //*************************
    
    // Animates In the option views and other labels (Run on background thread since UI lagging when running on main thread)
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.loader stopAnimating];
        self.loader = nil;
        [self showOptions];
    });
    
}

-(void)initWithItemsForLevel:(Levels*)levelName{
    // Run on background thread due to UI Lag
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.levelName = levelName.levelName;
        self.levelItems = [[[CLCoreDataHelper sharedCLCoreDataHelper]getAllLevelItemsForLevel:levelName.levelDetailGetterName] mutableCopy];
        [self.levelItems shuffle];
    });
    
}

-(void)showOptions{
    int tag = 1;
    for (int i = 0; i < 5; i++) {
        switch (i) {
            case 0:{
                POPSpringAnimation *viewPopAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
                viewPopAnim.toValue = @(1);
                viewPopAnim.delegate = self;
                viewPopAnim.springBounciness = 10;
                viewPopAnim.springSpeed = 4;
                viewPopAnim.beginTime = CACurrentMediaTime()+0.1*tag;
                
                [self.viewOne pop_addAnimation:viewPopAnim forKey:@"viewOnePopped"];
            }
                break;
            case 1:{
                POPSpringAnimation *viewPopAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
                viewPopAnim.toValue = @(1);
                viewPopAnim.delegate = self;
                viewPopAnim.springBounciness = 10;
                viewPopAnim.springSpeed = 4;
                viewPopAnim.beginTime = CACurrentMediaTime()+0.1*tag;
                
                [self.viewTwo pop_addAnimation:viewPopAnim forKey:@"viewTwoPopped"];
            }
                break;
            case 2:{
                POPSpringAnimation *viewPopAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
                viewPopAnim.toValue = @(1);
                viewPopAnim.delegate = self;
                viewPopAnim.springBounciness = 10;
                viewPopAnim.springSpeed = 4;
                viewPopAnim.beginTime = CACurrentMediaTime()+0.1*tag;
                
                [self.viewThree pop_addAnimation:viewPopAnim forKey:@"viewThreePopped"];
            }
                break;
            case 3:{
                POPSpringAnimation *viewPopAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewAlpha];
                viewPopAnim.toValue = @(1);
                viewPopAnim.delegate = self;
                viewPopAnim.springBounciness = 10;
                viewPopAnim.springSpeed = 4;
                viewPopAnim.beginTime = CACurrentMediaTime()+0.1*tag;
                
                [self.viewFour pop_addAnimation:viewPopAnim forKey:@"viewFourPopped"];
            }
                break;
            case 4:{
                POPSpringAnimation *viewPopAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionY];
                viewPopAnim.toValue = @(41);
                viewPopAnim.delegate = self;
                viewPopAnim.springBounciness = 10;
                viewPopAnim.springSpeed = 4;
                viewPopAnim.beginTime = CACurrentMediaTime()+0.1*tag;
                self.titleLabel.text = self.levelName;
                [self.titleLabel pop_addAnimation:viewPopAnim forKey:@"titleLabelPopped"];
            }
                
            default:
                break;
        }
        tag++;
    }
}

-(void)setImageNamed:(Objects*)object toView:(UIImageView*)imageView{
    [imageView setImage:[UIImage imageNamed:object.name]];
}

-(void)setUpViewsForAnimationStart{
    self.viewOne.layer.masksToBounds = YES;
    self.viewOne.layer.cornerRadius = 10;
    self.viewTwo.layer.masksToBounds = YES;
    self.viewTwo.layer.cornerRadius = 10;
    self.viewThree.layer.masksToBounds = YES;
    self.viewThree.layer.cornerRadius = 10;
    self.viewFour.layer.masksToBounds = YES;
    self.viewFour.layer.cornerRadius = 10;
    
    [self setImageNamed:[self.levelItems objectAtIndex:3] toView:self.imageViewFour];
    [self setImageNamed:[self.levelItems objectAtIndex:2] toView:self.imageViewThree];
    [self setImageNamed:[self.levelItems objectAtIndex:1] toView:self.imageViewTwo];
    [self setImageNamed:[self.levelItems objectAtIndex:0] toView:self.imageViewOne];
    self.viewOne.alpha = 0;
    self.viewTwo.alpha = 0;
    self.viewThree.alpha = 0;
    self.viewFour.alpha = 0;
}



@end
