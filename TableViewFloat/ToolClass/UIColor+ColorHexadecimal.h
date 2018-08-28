//
//  UIColor+ColorHexadecimal.h
//  moneyhll
//
//  Created by 李雪阳 on 16/12/20.
//  Copyright © 2016年 浙江龙之游旅游开发有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ColorHexadecimal)

// 颜色转换：iOS中（以#开头）十六进制的颜色转换为UIColor(RGB)

+ (UIColor *) colorWithHexString: (NSString *)color;

@end
