//
//  GroupDetailViewController.h
//  LampiPadApp
//
//  Created by wangbo on 13-6-26.
//  Copyright (c) 2013年 Mutual Mobile. All rights reserved.
//

#import "CommonCenterViewController.h"

@interface GroupDetailViewController : CommonCenterViewController<UIAlertViewDelegate> {
    
}

@property(nonatomic, strong) NSMutableArray *devices;

@property(nonatomic, strong) NSString *groupName;

@end
