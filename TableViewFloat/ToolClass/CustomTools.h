//
//  CustomTools.h
//  moneyhll
//
//  Created by 李雪阳 on 16/11/7.
//  Copyright © 2016年 浙江龙之游旅游开发有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoadButton.h"

@interface CustomTools : NSObject


/**
 自定义Label
 */
+ (UILabel *)labelWithTitle:(NSString *)text Font:(NSInteger)font textColor:(UIColor *)color;


/**
 自定义button
 */
+ (UIButton *)buttonWithTitle:(NSString *)title font:(NSInteger)font titleColor:(UIColor *)color Selector:(SEL)btnSelect Target:(UIViewController *)vc;


/**
 自定义View层上button
 */
+ (UIButton *)buttonFromViewWithTitle:(NSString *)title font:(NSInteger)font titleColor:(UIColor *)color Selector:(SEL)btnSelect Target:(UIView *)vc;


/**
 自定义加载按钮
 */
+ (LoadButton *)loadBtnWithTitle:(NSString *)title font:(NSInteger)font titleColor:(UIColor *)color LoadTintColor:(UIColor *)loadTintColor BtnBackColor:(UIColor *)backColor Selector:(SEL)btnSelect Target:(UIViewController *)vc;


/**
 自定义textfield
 */
+ (UITextField *)textFieldWithPlaceHolder:(NSString *)placeHolder textFont:(NSInteger)font textColor:(UIColor *)color;



/**
 自定义文字属性大小及颜色 label.attributedText
 
 @param lableText 要定义的文字内容
 @param sectionRange 改变属性的文字范围 例NSMakeRange(5, lableText.length-7)
 @param textFont 改变的字体大小
 @param textColor 改变的字体颜色 不更改传nil
 @param isbold 是否粗体
 */
+ (NSMutableAttributedString *)labelDifferentAttributedWithText:(NSString *)lableText Section:(NSRange)sectionRange Font:(NSInteger)textFont TextColor:(UIColor *)textColor Bold:(BOOL)isbold;


/**
 信息提示弹出框
 */
+ (void)showAlert:(NSString *)message Target:(UIViewController *)viewController;


/**
 任何情况下的信息提示弹出框
 */
+ (void)alertShowWithTitle:(NSString *)title Message:(NSString *)message;


/**
 信息提示弹框带有操作事件
 */
+ (void)alertActionWithTitle:(NSString *)title Message:(NSString *)message actionHandler:(void (^ __nullable)(UIAlertAction *action))handler Target:(UIViewController *)viewController;


/**
 HUD读取框
 */
+ (void)showHUDMessageTitle:(NSString *)title Target:(UIViewController *)viewController;


/**
 判断座机号
 */
+ (BOOL)isTelephoneNumber:(NSString *)telephone;


/**
 判断手机号
 */
+ (BOOL)isMobileNumber:(NSString *)mobileNum;


 /** 判断邮箱是否合法 */
+ (BOOL)checkEmail:(NSString *)email;

/**
 判断是否是纯数字
 */
+(BOOL)isFidureNumber:(NSString*)numer;



/**
 匹配中文，英文字母和数字及_
 */
+ (BOOL)isNormalAccount:(NSString *)accountName;


/**
 判断身份证
 */
+ (BOOL)checkUserIdCard:(NSString *)idCard;



/**
 判断是否有表情 (yes有表情)
 */
+ (BOOL)isContainsToEmoji:(NSString *)string;


/**
 禁止输入表情（输入表情就为空）
 */
+ (NSString *)disable_emoji:(NSString *)text;

/**
 数字每三位用逗号分隔
 
 @param number 需改变的数字
 @param prefix 前缀 如@“￥” 没有传nil
 @param suffix 后缀 如@“元” 没有传nil
 */
+ (NSString *_Nullable)separateNumberUseCommaWithNumber:(NSString *_Nullable)number Prefix:(NSString *_Nullable)prefix Suffix:(NSString *_Nullable)suffix;

/**
 解码URLDecodedString
 */
+ (NSString *)URLDecodedString:(NSString *)str;


/**
 汉字转 Unicode   张三 →  \u5f20\u4e09
 */
+ (NSString *)ChineseToUnicode:(NSString *)chinese;


#pragma mark Unicode转中文
+ (NSString*) replaceUnicode:(NSString*)TransformUnicodeString;


/**
 编码URLEncodedString
 */
+ (NSString *)URLEncodedString:(NSString *)str;



/**
 头像图片base64加密
 */
+ (NSString *)base64EncodingWithImage:(UIImage *)image;



/**
 base64加密data数据
 */
+ (NSString *)base64EncodingWithSourceData:(NSData *)sourceData;



/**
 base64加密
 */
+ (NSString *)base64EncryptWithString:(NSString *)enrtyptStr;



/**
 base64解密
 */
+ (NSString *)base64DecodingWithString:(NSString *)base64String;



/**
 从字符串(string)分割位置(segmentStr)开始取到后面的内容

 @param string 需要分割的字符串
 @param segmentStr 分割开始的位置字符串
 @return 取到的内容
 */
+ (NSString *)getElementFromString:(NSString *)string WithRangeSegmentString:(NSString *)segmentStr;



/**
 给字符串第index处插入一个字符串

 @param originStr 需要更改的字符串
 @param index 插入的位置
 @param string 插入的字符串
 */
+ (NSString *)insertElementFromString:(NSString *)originStr insertIndex:(NSInteger)index insertString:(NSString *)string;



/**
 添加webview加载动画
 */
+(UIActivityIndicatorView*)addWebViewLoadingViewWithTarget:(UIViewController*)VC;



/**
 从字典中元素排序
 */
+ (NSArray *)rankArrayFromDictionary:(NSDictionary *)infoDict;



/**
 时间戳转字符串时间

 @param timeStamp 时间戳
 @param showSecond 是否显示详细时间（是则返回时分秒）
 */
+ (NSString *)dateStringWithTimeStamp:(NSString *)timeStamp isShowExactTime:(BOOL)showSecond;


/**
 获取当前时间时间戳
 */
+ (NSString*)getCurrentTimeStamp;


/**
 字典字母排序拼接返回字符串
 */
+ (NSString *)orderSignStringWithDictionary:(NSDictionary *)dict;


/**
 项目签名方式
 */
+ (NSString *)APPSignWithData:(NSDictionary *)data;


/**
 商城签名方式
 */
+ (NSString *)StoreSignWithLastUrl:(NSString *)lastUrl;


/**
 时间转换
 */
+ (NSString *)stringFromDate;

/**
 获取当前时间

 @param isShow 是返回详细到时分秒 否返回年月日
 */
+ (NSString*)currentTimeIsYes:(BOOL)isShow;


#pragma mark 打电话
+(void) ringUpWithPhoneNumber:(NSString*)phoneNum;


#pragma mark 获取文字高度
+ (CGFloat)rectTextHeightWithString:(NSString *)string Font:(NSInteger)font TextWidth:(CGFloat)textWidth;

#pragma mark UILabel获取文字高度
+(CGFloat)heightForLabelWithContext:(NSString*)context width:(CGFloat)width fontSize:(NSInteger)fontSize;

#pragma mark 获取文字宽度
+ (CGFloat)rectTextWidthWithString:(NSString *)string Font:(NSInteger)font TextHeight:(CGFloat)textHeight;

#pragma mark 转化自定义格式日期
+ (NSString *)convertDateWithFormat:(NSString *)format Date:(NSDate *)date;

/**
 获取网络图片尺寸
 */
+ (CGSize)imageSizeWithImageUrl:(NSString*)imgUrl;



/**
 检测APP版本号

 @param appId APP在store中的id
 @param appUrl APP在store的下载地址
 */
+ (void)checkAppVersionWithAppID:(NSString *)appId AppUrl:(NSString *)appUrl Target:(UIViewController *)VC;



/**
 判断当前app版本和AppStore最新app版本大小

 @param newVersion 线上新版本
 @param oldVersion 老版本
 */
+ (BOOL)judgeNewVersion:(NSString *)newVersion withOldVersion:(NSString *)oldVersion;


/**
 大图片缩放
 */
+ (UIImage *_Nullable)scaleImage:(UIImage *_Nullable)image newSize:(CGSize)newSize;

#pragma mark view圆角
+(void)makeMornerRadiusWithView:(UIView*)view roundingCorners:(UIRectCorner)roundingCorners radius:(CGFloat)radius;

#pragma mark  和当前时间对比 时间格式 yyyy-MM-dd HH
+ (BOOL)compareCurrentTimeWithMyDate:(NSString*)myData;

@end
