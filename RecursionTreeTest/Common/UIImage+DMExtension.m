//
//  UIImage+DMExtension.m
//  RecursionTreeTest
//
//  Created by isoft on 2019/1/3.
//  Copyright © 2019 isoft. All rights reserved.
//

#import "UIImage+DMExtension.h"

@implementation UIImage (DMExtension)
- (UIImage *)dm_originalImageNamed:(NSString *)name {
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

- (UIImage *)dm_circleImage {
    CGFloat width   = self.size.width;
    CGFloat height  = self.size.height;
    //开启图片上下文
    UIGraphicsBeginImageContext(self.size);
    //绘制图片
    [self drawInRect:CGRectMake(0, 0, width, height)];
    //图片中心圆截取
    CGRect clipRect = (width > height) ? CGRectMake((width - height)/2, 0, height, height) : CGRectMake(0, (height - width)/2, width, width);
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:clipRect];
    [clipPath addClip];
    
    UIImage *image  = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)dm_imageScaleToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)dm_imageScaleToMax:(CGFloat)max min:(CGFloat)min {
    //图片原始宽高
    CGFloat oWidth = self.size.width;
    CGFloat oHeight = self.size.height;
    
    //1. 宽高都小于最大尺寸，不需要缩放
    if (oWidth <= max && oHeight <= max) {
        return self;
    }
    //2. 需要缩放
    //缩放后的宽高
    CGFloat sWidth = 0.0f;
    CGFloat sHeight = 0.0f;
    if (oWidth > oHeight) {//宽度 > 高度
        if (oWidth > max) {//以宽度缩放
            sWidth = max;
            sHeight = oHeight * (sWidth / oWidth);
            
            if (sHeight < min) {//横向长图，
                sHeight = min;
                sWidth  = oWidth * (sHeight / oHeight);
            }
        }
    } else {//高度 > 宽度
        if (oHeight > max) {//以高度缩放
            sHeight = max;
            sWidth = oWidth * (sHeight / oHeight);
            
            if (sWidth < min) {//纵向长图
                sWidth = min;
                sHeight = oHeight * (sWidth / oWidth);
            }
        }
    }
    
    //缩放到对应尺寸
    return [self dm_imageScaleToSize:CGSizeMake(sWidth, sHeight)];
}

+ (UIImage *)dm_imageWithColor:(UIColor *)color {
    return [self dm_imageWithColor:color size:CGSizeMake(1, 1)];
}

+ (UIImage *)dm_imageWithColor:(UIColor *)color size:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [color set];
    UIRectFill(CGRectMake(0, 0, size.width, size.height));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)dm_imageWithTitle:(NSString *)title font:(CGFloat)font color:(UIColor *)color {
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:font],
                                 NSForegroundColorAttributeName : color};
    CGSize size = [title sizeWithAttributes:attributes];
    UIGraphicsBeginImageContext(size);
    [title drawInRect:CGRectMake(0, 0, size.width, size.height) withAttributes:attributes];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}
+ (UIImage *)dm_QRImageWithString:(NSString *)string size:(CGFloat)size {
    NSData *data        = [string dataUsingEncoding:NSUTF8StringEncoding];
    // 生成二维码
    CIFilter *filter    = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *ciImage    = filter.outputImage;
    
    // 创建图片
    CGRect extent       = CGRectIntegral(ciImage.extent);
    CGFloat scale       = MIN(size / CGRectGetWidth(extent), size / CGRectGetHeight(extent));
    size_t width        = CGRectGetWidth(extent) * scale;
    size_t height       = CGRectGetHeight(extent) * scale;
    
    CGContextRef bitmapRef  = CGBitmapContextCreate(nil, width, height, 8, 0, CGColorSpaceCreateDeviceGray(), (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context      = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage  = [context createCGImage:ciImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    CGImageRef scaleImage   = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaleImage];
}

- (NSString *)dm_QRString {
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode
                                              context:nil
                                              options:@{ CIDetectorAccuracy : CIDetectorAccuracyHigh }];
    CIImage *ciImage    = [[CIImage alloc] initWithImage:self];
    NSArray *features   = [detector featuresInImage:ciImage];
    NSMutableString *mString = [NSMutableString string];
    for (CIQRCodeFeature *feature in features) {
        [mString appendString:feature.messageString];
    }
    return [mString copy];
}
+(UIImage *)dm_imageWithName:(NSString *)name isScale:(BOOL)isScale scale:(float)scale{
    UIImage*image=[UIImage imageNamed:name];
    if (isScale) {
          return  [image dm_imageWithScale:scale];
    }
    return image;
}
+(UIImage *)dm_imageHighlightedWithName:(NSString *)name isScale:(BOOL)isScale scale:(float)scale{
    UIImage*image=[UIImage imageNamed:[NSString stringWithFormat:@"%@_h",name]];
    if (isScale) {
      return  [image dm_imageWithScale:scale];
    }
    return image;
}
-(UIImage *)dm_imageWithScale:(float)scale{
    CGSize size             = self.size;
    CGFloat width           = size.width;
    CGFloat height          = size.height;
    CGFloat scaledWidth     = width * scale;
    CGFloat scaledHeight    = height * scale;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(scaledWidth, scaledHeight), NO, [UIScreen mainScreen].scale);
    [self drawInRect:CGRectMake(0, 0, scaledWidth, scaledHeight)];
    UIImage *scaleImage     = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaleImage;
}
@end
