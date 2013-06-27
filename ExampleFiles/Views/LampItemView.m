//
//  LampItemView.m
//  LampiPadApp
//
//  Created by wangbo on 13-6-26.
//  Copyright (c) 2013年 Mutual Mobile. All rights reserved.
//

#import "LampItemView.h"

@implementation LampItemView
@synthesize state = _state;
@synthesize lampName = _lampName;

- (void)dealloc {
    self.lampName = nil;
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lamp_icon"]];
        imageView.frame = (CGRect){{0,0},{CGRectGetWidth(frame),CGRectGetHeight(frame)}};
        [self addSubview:imageView];
//        NSLog(@"")
        NSLog(@"lamp_frame:%@",NSStringFromCGRect(imageView.frame));
        
        
        UIView *back = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(imageView.frame) / 2, CGRectGetWidth(imageView.frame), CGRectGetHeight(imageView.frame) / 2)];
        back.backgroundColor = [UIColor blackColor];
        back.alpha = 0.5;
        [self addSubview:back];
        
        imageArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"lamp_icon_unselected"]];
        imageArrow.frame = CGRectMake(0, 0, CGRectGetWidth(frame)-60, CGRectGetHeight(frame)/2-20);
        imageArrow.center = CGPointMake(imageView.center.x, imageView.center.y*1.5);
        [self addSubview:imageArrow];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lampTapped)];
        [self addGestureRecognizer:tap];
        _state = LampItemUnSelected;
    }
    return self;
}

- (void) lampTapped{
    if (self.state == LampItemDisnabled) {
        return;
    }
    [self toggleState];
}

- (void)setState:(LampItemState)state {
    if (_state != state) {
        _state = state;
    }
    if (_state == LampItemSelected) {
        imageArrow.image = [UIImage imageNamed:@"lamp_icon_selected"];
    } else if (_state == LampItemUnSelected){
        imageArrow.image = [UIImage imageNamed:@"lamp_icon_unselected"];
    } else {
        imageArrow.image = [UIImage imageNamed:@"lamp_icon_disabled"];
    }
}

- (void)toggleState {
    if (self.state == LampItemUnSelected) {
        self.state = LampItemSelected;
    } else if (self.state == LampItemSelected) {
        self.state = LampItemUnSelected;
    }
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
