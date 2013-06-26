//
//  GroupDetailViewController.m
//  LampiPadApp
//
//  Created by wangbo on 13-6-26.
//  Copyright (c) 2013年 Mutual Mobile. All rights reserved.
//

#import "GroupDetailViewController.h"

#import "LampItemView.h"

@interface GroupDetailViewController ()

@end

@implementation GroupDetailViewController

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
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(closeViewController)];
    self.navigationItem.leftBarButtonItem = item;
    
    
    for (int i = 0; i < 5; i ++) {
        LampItemView *liv = [[LampItemView alloc] initWithFrame:(CGRect){{i*160,0},{120,120}}];
        [self.view addSubview:liv];
        
    }
    
}

- (void)closeViewController {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
