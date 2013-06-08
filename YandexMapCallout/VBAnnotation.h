//
//  VBAnnotation.h
//  YandexMapCallout
//
//  Created by Vitaliy Berg on 6/8/13.
//  Copyright (c) 2013 Vitaliy Berg. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <YandexMapKit/YandexMapKit.h>

@interface VBAnnotation : NSObject <YMKAnnotation>

@property (nonatomic, assign) YMKMapCoordinate coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, strong) id userInfo;

@end
