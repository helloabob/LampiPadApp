//
//  LampItemView.h
//  LampiPadApp
//
//  Created by wangbo on 13-6-26.
//  Copyright (c) 2013年 Mutual Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LampItemUnSelected=0,
    LampItemSelected,
    LampItemDisnabled,
}LampItemState;

@interface LampItemView : UIView {
    LampItemState _state;
    UIImageView *imageArrow;
}

@property (nonatomic, assign) LampItemState state;
@property (nonatomic, strong) NSString *lampName;

- (void)toggleState;

@end
