//
//  VBCalloutContentView.h
//  YandexMapCallout
//
//  Created by Vitaliy Berg on 6/9/13.
//  Copyright (c) 2013 Vitaliy Berg. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YandexMapKit/YandexMapKit.h>

@interface VBCalloutContentView : UIView <YMKCalloutContentView>

@property (nonatomic, weak, readonly) UILabel *titleLabel;
@property (nonatomic, weak, readonly) UILabel *subtitleLabel;

@end
