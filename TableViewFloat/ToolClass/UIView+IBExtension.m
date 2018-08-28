//
//  UIView+IBExtension.m
//  Weibo11
//
//  Created by JYJ on 15/12/6.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "UIView+IBExtension.h"

@implementation UIView (IBExtension)

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (UIColor *)borderColor {
    return [UIColor colorWithCGColor:self.layer.borderColor];
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}

- (CGFloat)borderWidth {
    return self.layer.borderWidth;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    
}

- (CGFloat)cornerRadius {
    return self.layer.cornerRadius;
}

@end
