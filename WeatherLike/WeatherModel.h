//
//  WeatherModel.h
//  WeatherLike
//
//  Created by 黄家树 on 2017/5/16.
//  Copyright © 2017年 huangjiashu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherModel : NSObject

@property(nonatomic,strong)NSString *cityName;
@property(nonatomic,strong)NSDictionary *todayDic;
@property(nonatomic,strong)NSDictionary *tomorrowDic;
@property(nonatomic,strong)NSDictionary *afterTomorrowDic;


@end
