//
//  GroupListViewController.h
//  LampiPadApp
//
//  Created by wangbo on 13-6-25.
//  Copyright (c) 2013年 Mutual Mobile. All rights reserved.
//

#import "CommonCenterViewController.h"

@interface GroupListViewController : CommonCenterViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *tblList;

@property (strong, nonatomic) NSArray *arrayMenu;

@end
