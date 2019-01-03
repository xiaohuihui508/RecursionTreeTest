//
//  UIImage+DMExtension.h
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DMExtension)
/**
 *  无渲染图片
 */
- (UIImage *)dm_originalImageNamed:(NSString *)name;

/**
 *  裁剪为圆形图片
 */
- (UIImage *)dm_circleImage;

/**
 *  将图片缩放到指定尺寸
 */
- (UIImage *)dm_imageScaleToSize:(CGSize)size;
/**
 *  将图片缩放到指定的限定范围内(min ~ max)
 */
- (UIImage *)dm_imageScaleToMax:(CGFloat)max min:(CGFloat)min;


#pragma mark - 颜色图片
/**
 *  1*1 的纯色图片
 */
+ (UIImage *)dm_imageWithColor:(UIColor *)color;
/**
 *  指定尺寸纯色图片
 */
+ (UIImage *)dm_imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark - 文字图片
/**
 *  文字图片
 */
+ (UIImage *)dm_imageWithTitle:(NSString *)title font:(CGFloat)font color:(UIColor *)color;

/**
 * 生成二维码图片
 *
 * @param string    二维码的字符串
 * @param size      图片的宽高尺寸
 */
+ (UIImage *)dm_QRImageWithString:(NSString *)string size:(CGFloat)size;

/**
 * 解析二维码图片表示的字符串
 */
- (NSString *)dm_QRString;


/**
 普通图片

 @param name 图片名字
 @param isScale 是否需要压缩
 @param scale 压缩系数
 @return 图片
 */
+ (UIImage *)dm_imageWithName:(NSString *)name isScale:(BOOL)isScale scale:(float)scale;

/**
 高亮或者选中图片

 @param name 图片名字
 @param isScale 是否需要压缩
 @param scale 压缩系数
 @return 图片
 */
+ (UIImage *)dm_imageHighlightedWithName:(NSString *)name isScale:(BOOL)isScale scale:(float)scale;
/**
 * 等比压缩图片
 */
- (UIImage *)dm_imageWithScale:(float)scale;

@end
