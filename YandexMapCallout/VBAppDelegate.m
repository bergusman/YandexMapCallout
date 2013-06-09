//
//  VBAppDelegate.m
//  YandexMapCallout
//
//  Created by Vitaliy Berg on 6/8/13.
//  Copyright (c) 2013 Vitaliy Berg. All rights reserved.
//

#import "VBAppDelegate.h"

#import <YandexMapKit/YandexMapKit.h>

#warning Set your API Key
#define YANDEX_MAP_API_KEY @""

@implementation VBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[YMKConfiguration sharedInstance] setApiKey:YANDEX_MAP_API_KEY];
    return YES;
}

@end
