//
//  WBUISlider.m
//  LampiPadApp
//
//  Created by wangbo on 13-6-25.
//  Copyright (c) 2013年 Mutual Mobile. All rights reserved.
//

#import "WBUISlider.h"

@implementation WBUISlider

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self setup];
        
    }
    return self;
}

- (void)setup {
    [self setThumbTintColor:[UIColor colorWithRed:167.0/255.0 green:167.0/255.0 blue:167.0/255.0 alpha:1.0]];
    [self setMinimumTrackTintColor:[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1.0]];
    [self setMaximumTrackTintColor:[UIColor colorWithRed:78.0/255.0 green:79.0/255.0 blue:80.0/255.0 alpha:1.0]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
