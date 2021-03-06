//
//  VBViewController.m
//  YandexMapCallout
//
//  Created by Vitaliy Berg on 6/8/13.
//  Copyright (c) 2013 Vitaliy Berg. All rights reserved.
//

#import "VBViewController.h"

#import "VBCalloutView.h"
#import "VBCalloutContentView.h"

#import "VBAnnotation.h"

#import <YandexMapKit/YandexMapKit.h>

@interface VBViewController () <YMKMapViewDelegate>

@property (weak, nonatomic) IBOutlet YMKMapView *mapView;

@end

@implementation VBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupMapView];
    [self addAnnotations];
}

- (void)setupMapView {
    self.mapView.showsUserLocation = YES;
    self.mapView.showTraffic = NO;
    
    YMKMapCoordinate center = YMKMapCoordinateMake(55.75586, 37.617726);
    [self.mapView setCenterCoordinate:center atZoomLevel:12 animated:NO];
    
    [self moveYandexLogo];
}

- (void)addAnnotations {
    NSArray *points = @[
        [NSValue valueWithYMKMapCoordinate:YMKMapCoordinateMake(55.772602, 37.609073)],
        [NSValue valueWithYMKMapCoordinate:YMKMapCoordinateMake(55.764913, 37.578729)],
        [NSValue valueWithYMKMapCoordinate:YMKMapCoordinateMake(55.71988, 37.63652)]
    ];
    
    for (NSValue *point in points) {
        YMKMapCoordinate coordinate = [point YMKMapCoordinateValue];
        
        VBAnnotation *annotation = [VBAnnotation new];
        annotation.coordinate = coordinate;
        annotation.title = @"Objective-C";
        annotation.subtitle = @"Objective-C is a general-purpose, high-level, object-oriented programming language that adds Smalltalk-style messaging to the C programming language.";
        [self.mapView addAnnotation:annotation];
    }
}

- (void)moveYandexLogo {
    for (UIView *view in self.mapView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            view.center = CGPointMake(self.view.center.x, view.center.y);
        }
    }
}

#pragma mark - YMKMapViewDelegate

- (YMKAnnotationView *)mapView:(YMKMapView *)mapView viewForAnnotation:(id<YMKAnnotation>)annotation {
    return nil;
}

- (YMKCalloutView *)mapView:(YMKMapView *)mapView calloutViewForAnnotation:(id<YMKAnnotation>)annotation {
    if ([annotation isKindOfClass:[YMKUserLocation class]]) {
        return nil;
    }
    
    static NSString *calloutIdentifier = @"calloutIdentifier";
    VBCalloutView * calloutView = (VBCalloutView *)[mapView dequeueReusableCalloutViewWithIdentifier:calloutIdentifier];
    if (!calloutView) {
        calloutView = [[VBCalloutView alloc] initWithReuseIdentifier:calloutIdentifier];
        
        UINib *nib = [UINib nibWithNibName:NSStringFromClass([VBCalloutContentView class]) bundle:[NSBundle mainBundle]];
        VBCalloutContentView *contentView = (VBCalloutContentView *)[nib instantiateWithOwner:nil options:nil][0];
        calloutView.contentView = contentView;
    }
    
    VBCalloutContentView *contentView = (VBCalloutContentView *)calloutView.contentView;
    contentView.titleLabel.text = [annotation title];
    contentView.subtitleLabel.text = [annotation subtitle];
    
    return calloutView;
}

- (CGRect)mapViewVisibleRect:(YMKMapView *)mapView {
    return CGRectInset(self.mapView.bounds, 10, 10);
}

@end
