//
//  VBCalloutView.m
//  YandexMapCallout
//
//  Created by Vitaliy Berg on 6/8/13.
//  Copyright (c) 2013 Vitaliy Berg. All rights reserved.
//

#import "VBCalloutView.h"

@implementation VBCalloutView {
    UIImageView *_defaultAnchorView;
    
    UIImageView *_customCalloutBackgroundView;
    UIImageView *_customAnchorView;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        if ([self.subviews count] > 0 &&
            [self.subviews[0] isKindOfClass:NSClassFromString(@"YMKCalloutBackgroundView")])
        {
            UIView *calloutBackgroundView = self.subviews[0];
            
            if ([calloutBackgroundView.subviews count] >= 3) {
                calloutBackgroundView.hidden = YES;
                _defaultAnchorView = calloutBackgroundView.subviews[2];
                
                UIImage *bg = [UIImage imageNamed:@"callout-body"];
                bg = [bg stretchableImageWithLeftCapWidth:12 topCapHeight:12];
                
                _customCalloutBackgroundView = [[UIImageView alloc] init];
                _customCalloutBackgroundView.image = bg;
                [self addSubview:_customCalloutBackgroundView];
                
                _customAnchorView = [[UIImageView alloc] init];
                _customAnchorView.image = [UIImage imageNamed:@"callout-anchor"];
                [self addSubview:_customAnchorView];
            }
        }
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (_customCalloutBackgroundView) {
        CGSize size = self.bounds.size;
        CGFloat x = _defaultAnchorView.center.x;
        
        _customCalloutBackgroundView.frame = CGRectMake(0, 0, size.width, size.height - 9);
        _customAnchorView.frame = CGRectMake(x - 11, size.height - 18, 22, 20);
    }
}

@end
