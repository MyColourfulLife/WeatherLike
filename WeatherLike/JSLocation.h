//
//  JSLocation.h
//  WeatherLike
//
//  Created by 黄家树 on 2017/5/16.
//  Copyright © 2017年 huangjiashu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^saveLocaiotnBlock)(double lat, double lon, NSString *cityName);

@interface JSLocation : NSObject<CLLocationManagerDelegate>

+(void)getUserLocation:(saveLocaiotnBlock)locationBlock;


@end
