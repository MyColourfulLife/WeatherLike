//
//  CityGroup.m
//  WeatherLike
//
//  Created by 黄家树 on 2017/5/16.
//  Copyright © 2017年 huangjiashu. All rights reserved.
//

#import "CityGroup.h"

@implementation CityGroup

- (NSString *)description
{
    return [NSString stringWithFormat:@" title:%@ cities:%@", self.title,self.cities];
}

@end
