//
//  FloatHeader.h
//  TableViewFloat
//
//  Created by 李雪阳 on 2018/8/28.
//  Copyright © 2018年 singularity. All rights reserved.
//


#import "UIColor+ColorHexadecimal.h"
#import "CustomTools.h"
#import "Masonry.h"
#import "UIView+IBExtension.h"

#ifndef FloatHeader_h
#define FloatHeader_h



#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WINDOW_HEIGHT (SCREEN_HEIGHT-(STATUS_HEIGHT+44))
#define STATUS_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height//状态栏高度

#endif /* FloatHeader_h */
