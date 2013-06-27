//
//  GroupListViewController.m
//  LampiPadApp
//
//  Created by wangbo on 13-6-25.
//  Copyright (c) 2013年 Mutual Mobile. All rights reserved.
//

#import "GroupListViewController.h"

#import "CommonCenterViewController.h"

#import "GroupDetailViewController.h"

#import "ConfigurationManager.h"

@interface GroupListViewController ()

@end

@implementation GroupListViewController

- (void)dealloc {
    self.arrayMenu = nil;
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.arrayMenu = [ConfigurationManager getGroups];
    [self.tblList reloadData];
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
    
//    self.arrayMenu = [NSArray arrayWithObjects:@"Group1", @"Group2" , nil];
    
    self.arrayMenu = [NSArray array];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addGroup)];
    
    self.navigationItem.rightBarButtonItem = item;
    [item release];
    
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:uibarbutton target:self action:nil];
    
    
}

- (void)addGroup {
    GroupDetailViewController *vv = [[[GroupDetailViewController alloc] init] autorelease];
//    [self.navigationController presentViewController:vv animated:YES completion:nil];
//    UIViewController *vv = [[UIViewController alloc] init];
    UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:vv] autorelease];
//    [self.navigationController pushViewController:vv animated:YES];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
    NSLog(@"addGroup");
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
    
    GroupDetailViewController *vv = [[[GroupDetailViewController alloc] init] autorelease];
    vv.groupName = [self.arrayMenu objectAtIndex:indexPath.row];
    //    [self.navigationController presentViewController:vv animated:YES completion:nil];
    //    UIViewController *vv = [[UIViewController alloc] init];
    UINavigationController *nav = [[[UINavigationController alloc] initWithRootViewController:vv] autorelease];
    //    [self.navigationController pushViewController:vv animated:YES];
    [self.navigationController presentViewController:nav animated:YES completion:nil];
    
}

@end
