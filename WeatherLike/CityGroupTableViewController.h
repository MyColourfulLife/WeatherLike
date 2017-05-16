//
//  CityGroupTableViewController.h
//  WeatherLike
//
//  Created by 黄家树 on 2017/5/16.
//  Copyright © 2017年 huangjiashu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityGroup.h"


typedef void(^MyBlock)(NSString *cityName);

@interface CityGroupTableViewController : UITableViewController

@property (nonatomic, copy) MyBlock block;

@end
