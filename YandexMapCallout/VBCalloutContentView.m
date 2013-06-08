//
//  VBCalloutContentView.m
//  YandexMapCallout
//
//  Created by Vitaliy Berg on 6/9/13.
//  Copyright (c) 2013 Vitaliy Berg. All rights reserved.
//

#import "VBCalloutContentView.h"

@implementation VBCalloutContentView {
    __weak IBOutlet UILabel *_titleLabel;
    __weak IBOutlet UILabel *_subtitleLabel;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGSize titleSize = [_subtitleLabel sizeThatFits:CGSizeMake(size.width - 12, 0)];
    CGSize subtitleSize = [_subtitleLabel sizeThatFits:CGSizeMake(size.width - 12, size.height - 42)];
    return CGSizeMake(MAX(titleSize.width, subtitleSize.width), subtitleSize.height + 42);
}

@end
