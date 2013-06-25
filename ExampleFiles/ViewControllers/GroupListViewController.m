//
//  GroupListViewController.m
//  LampiPadApp
//
//  Created by wangbo on 13-6-25.
//  Copyright (c) 2013年 Mutual Mobile. All rights reserved.
//

#import "GroupListViewController.h"

@interface GroupListViewController ()

@end

@implementation GroupListViewController

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
    
//    self.tblList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, appWidth, appHeight)];
    self.tblList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, appWidth, appHeight) style:UITableViewStyleGrouped];
    self.tblList.backgroundColor = [UIColor clearColor];
    self.tblList.backgroundView = nil;
    self.tblList.delegate = self;
    self.tblList.dataSource = self;
    [self.view addSubview:self.tblList];
    
    self.arrayMenu = [NSArray arrayWithObjects:@"Group1",@"Group2" , nil];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    self.navigationItem.rightBarButtonItem = item;
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:uibarbutton target:self action:nil];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.arrayMenu.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell1";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row == self.arrayMenu.count) {
        cell.textLabel.text = @"Reset All Presets";
    } else {
        cell.textLabel.text = [self.arrayMenu objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    
    //    if (indexPath.row == DeviceConfigRow) {
    //        DeviceListViewController *deviceViewController = [[DeviceListViewController alloc] init];
    //        [self.navigationController pushViewController:deviceViewController animated:YES];
    //        [deviceViewController release];
//    if (indexPath.row == self.arrayMenu.count) {
//        MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
//        hud.labelText = @"Reseting...";
//        [self.navigationController.view addSubview:hud];
//        [hud show:YES];
//        [hud hide:YES afterDelay:1.0f];
//        [ConfigurationManager resetAllPresets];
//    } else {
//        PresetConfigViewController *detailViewController = [[PresetConfigViewController alloc] init];
//        detailViewController.title = [[self.arrayMenu objectAtIndex:indexPath.row] objectForKey:PresetNameKey];
//        [Common setCurrentConfigPresetName:[[self.arrayMenu objectAtIndex:indexPath.row] objectForKey:PresetNameKey]];
//        //        detailViewController.title = [[self.arrayMenu objectAtIndex:indexPath.row] objectForKey:OfficeNameKey];
//        //        detailViewController.roomIndex = indexPath.row;
//        // ...
//        // Pass the selected object to the new view controller.
//        [self.navigationController pushViewController:detailViewController animated:YES];
//        [detailViewController release];
//    }
    
    //
    //    }
    
//    [self performSelector:@selector(unselectCurrentRow) withObject:nil afterDelay:0.5f];
}

@end
