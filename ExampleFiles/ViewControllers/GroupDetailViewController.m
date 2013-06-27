//
//  GroupDetailViewController.m
//  LampiPadApp
//
//  Created by wangbo on 13-6-26.
//  Copyright (c) 2013年 Mutual Mobile. All rights reserved.
//

#import "GroupDetailViewController.h"

#import "LampItemView.h"

#import "ConfigurationManager.h"

#import "MBProgressHUD.h"

@interface GroupDetailViewController ()

@end

@implementation GroupDetailViewController

- (void)dealloc {
    self.devices = nil;
    [super dealloc];
}

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
    
    if (self.groupName) {
        self.title = self.groupName;
    } else {
        self.title = @"Add New Group";
    }
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(closeViewController)];
    self.navigationItem.leftBarButtonItem = item;
    [item release];
    
    item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(commitViewController)];
    self.navigationItem.rightBarButtonItem = item;
    [item release];
    
    self.devices = [ConfigurationManager objectForKey:DeviceUserDefaultKey];
    
    
    NSLog(@"devices:%@",self.devices);
    
//    self.view.backgroundColor = [UIColor blueColor];
    
    int rows = 0;
    int cols = 0;
    for (int i=0;i<self.devices.count;i++) {
        NSDictionary *dict = [self.devices objectAtIndex:i];
        
        if (i!=0 && i%7==0) {
            rows ++;
            cols = 0;
        }
        LampItemView *liv = [[LampItemView alloc] initWithFrame:CGRectMake(cols*140+30, rows*140+30, 120, 120)];
        if (![[dict objectForKey:DeviceGroupKey] isEqualToString:@""]) {
            if (self.groupName && [self.groupName isEqualToString:[dict objectForKey:DeviceGroupKey]]) {
                liv.state = LampItemSelected;
            } else {
                liv.state = LampItemDisnabled;
            }
        }
        liv.lampName = [dict objectForKey:DeviceNameKey];
        [self.view addSubview:liv];
        cols ++;
    }
    UIView *vvv = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:vvv];
    
    
    
//    for (int j = 0;j < 4;j ++) {
//        for (int i = 0; i < 7; i ++) {;
//            LampItemView *liv = [[LampItemView alloc] initWithFrame:CGRectMake(i*140+30, j*140+30, 120, 120)];
//            if (i % 6 == 0) {
//                liv.state = LampItemDisnabled;
//            }
//            [self.view addSubview:liv];
//        }
//    }
}

- (void)commitViewController {
    BOOL fg = NO;
    for (id view in self.view.subviews) {
        if ([view isKindOfClass:[LampItemView class]]) {
            LampItemView *tmp = (LampItemView *)view;
            if (tmp.state == LampItemSelected) {
                fg = YES;
                break;
            }
        }
    }
    if (!fg) {
        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
        hud.labelText = @"You have to select at least one light.";
        [self.navigationController.view addSubview:hud];
        [hud show:YES];
        [hud hide:YES afterDelay:1.0f];
        return;
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Group Name" message:@"Enter the group name below" delegate:self cancelButtonTitle:@"Commit" otherButtonTitles:@"Cancel", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *textField = [alert textFieldAtIndex:0];
    textField.keyboardType = UIKeyboardTypeDefault;
    if (self.groupName) {
        textField.text = self.groupName;
    }
    [alert addSubview:textField];
    [alert show];
    [alert release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        for (UIView *view in [alertView subviews]) {
            if ([view isKindOfClass:[UITextField class]]){
                UITextField *textName = (UITextField *)view;
                if (textName.text.length <= 0) {
                    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
                    hud.labelText = @"Group name is empty, please try again.";
                    [self.navigationController.view addSubview:hud];
                    [hud show:YES];
                    [hud hide:YES afterDelay:2.0f];
                } else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
                    hud.labelText = @"Saving...";
                    [self.navigationController.view addSubview:hud];
                    [hud show:YES];
                    [hud hide:YES afterDelay:2.0f];
                    [self performSelector:@selector(closeViewController) withObject:nil afterDelay:2.0f];
                    [self saveDeviceGroup:textName.text];
                }
            }
        }
    } else {
        
    }
}

- (void)saveDeviceGroup:(NSString *)groupName {
    NSMutableArray *array = [ConfigurationManager objectForKey:DeviceUserDefaultKey];
    for (id view in self.view.subviews) {
        if ([view isKindOfClass:[LampItemView class]]) {
            LampItemView *tmp = (LampItemView *)view;
            if (tmp.state == LampItemDisnabled) {
                continue;
            } else {
                for (NSMutableDictionary *dict in array) {
                    if ([[dict objectForKey:DeviceNameKey] isEqualToString:tmp.lampName]) {
                        if (tmp.state == LampItemSelected) {
                            [dict setObject:groupName forKey:DeviceGroupKey];
                        } else {
                            [dict setObject:@"" forKey:DeviceGroupKey];
                        }
                    }
                }
            }
        }
    }
    [ConfigurationManager setObject:array forKey:DeviceUserDefaultKey];
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
