//
//  JSLocation.m
//  WeatherLike
//
//  Created by 黄家树 on 2017/5/16.
//  Copyright © 2017年 huangjiashu. All rights reserved.
//

#import "JSLocation.h"
#import <UIKit/UIKit.h>
@implementation JSLocation{
    CLLocationManager *_manager;
    saveLocaiotnBlock _savelocationBlock;
    NSString *_cityName;
}



+(instancetype)sharedLocationManger{
    static JSLocation *locationManger = nil;
    if (!locationManger) {
        locationManger = [[self alloc]init];
    }
    return locationManger;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [[CLLocationManager alloc]init];
        
        if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
            [_manager requestWhenInUseAuthorization];
        }
        _manager.delegate = self;
    }
    return self;
}


+(void)getUserLocation:(saveLocaiotnBlock)locationBlock{
  return [[self sharedLocationManger] getUserLocation:locationBlock];
}



-(void)getUserLocation:(saveLocaiotnBlock)locationBlock{
    
    if (![CLLocationManager locationServicesEnabled]) {
        return;
    }
    
    
    if ([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus]==kCLAuthorizationStatusDenied) {
        _savelocationBlock = [locationBlock copy];
        _savelocationBlock(39.9110130000,116.4135540000,@"北京");
        return;
    }
    
    _savelocationBlock = [locationBlock copy];
    _manager.distanceFilter = 100;
    [_manager startUpdatingLocation];
}


#pragma mark - CLLocatoinManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    
    CLLocation *location = locations.lastObject;
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (!error) {
            
            NSString *cityName = placemarks.lastObject.addressDictionary[@"City"];
//            NSString *cityName = placemarks.lastObject.locality;
            NSString *str = [cityName substringToIndex:cityName.length-1];
            _savelocationBlock(location.coordinate.latitude,location.coordinate.longitude,str);

        }
    }];
    
    
}



@end
