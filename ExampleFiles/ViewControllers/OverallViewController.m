//
//  OverallViewController.m
//  LampiPadApp
//
//  Created by wangbo on 13-6-25.
//  Copyright (c) 2013年 Mutual Mobile. All rights reserved.
//

#import "OverallViewController.h"

#import <QuartzCore/QuartzCore.h>

#import "WBUISlider.h"

@interface OverallViewController ()

@end

@implementation OverallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"Overall";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_test_back"] forState:UIControlStateNormal];
    [btn setTitle:@"ALL ON" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(20, 20, (appWidth - 60) / 2, 50)];
    btn.layer.shadowOffset =  CGSizeMake(3, 5);
    btn.layer.shadowOpacity = 0.8;
    btn.layer.shadowColor =  [UIColor blackColor].CGColor;
    [self.view addSubview:btn];
    int nx = CGRectGetMaxX(btn.frame);
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_test_back"] forState:UIControlStateNormal];
    [btn setTitle:@"ALL OFF" forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(20 + nx, 20, (appWidth - 60) / 2, 50)];
    btn.layer.cornerRadius = 10.0f;
    btn.layer.shadowOffset =  CGSizeMake(3, 5);
    btn.layer.shadowOpacity = 0.8;
    btn.layer.shadowColor =  [UIColor blackColor].CGColor;
    [self.view addSubview:btn];
    
    nx = CGRectGetMaxY(btn.frame);
    
    
    
    TTSwitch *squareThumbSwitch = [[TTSwitch alloc] initWithFrame:(CGRect){ {20,nx+23}, { 76.0f, 27.0f } }];
    squareThumbSwitch.trackImage = [UIImage imageNamed:@"square-switch-track"];
    squareThumbSwitch.overlayImage = [UIImage imageNamed:@"square-switch-overlay"];
    squareThumbSwitch.thumbImage = [UIImage imageNamed:@"square-switch-thumb"];
    squareThumbSwitch.thumbHighlightImage = [UIImage imageNamed:@"square-switch-thumb-highlight"];
    squareThumbSwitch.trackMaskImage = [UIImage imageNamed:@"square-switch-mask"];
    squareThumbSwitch.thumbMaskImage = nil; // Set this to nil to override the UIAppearance setting
    squareThumbSwitch.thumbInsetX = -3.0f;
    squareThumbSwitch.thumbOffsetY = -3.0f; // Set this to -3 to compensate for shadow
    squareThumbSwitch.changeHandler = ^(BOOL on){
        nslider.enabled = on;
    };
    squareThumbSwitch.on = YES;
    
    [self.view addSubview:squareThumbSwitch];
    [squareThumbSwitch release];
    
    WBUISlider *slider = [[WBUISlider alloc] initWithFrame:CGRectMake(CGRectGetMaxX(squareThumbSwitch.frame) + 20, nx + 20, CGRectGetMaxX(btn.frame)-(CGRectGetMaxX(squareThumbSwitch.frame) + 20), 35)];
    [self.view addSubview:slider];
//    slider.enabled = NO;
    nslider = slider;
    [slider release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ToggleViewDelegate

- (void)selectLeftButton
{
    NSLog(@"LeftButton Selected");
}

- (void)selectRightButton
{
    NSLog(@"RightButton Selected");
}

@end
