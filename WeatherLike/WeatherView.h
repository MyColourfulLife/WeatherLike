//
//  WeatherView.h
//  WeatherLike
//
//  Created by 黄家树 on 2017/5/16.
//  Copyright © 2017年 huangjiashu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherModel.h"

@interface WeatherView : UIImageView

@property (nonatomic,strong)WeatherModel *model;
@property (nonatomic,strong)UIButton *cityBt;


@end
