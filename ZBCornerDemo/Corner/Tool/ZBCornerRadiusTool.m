//
//  ZBCornerRadiusTool.m
//  ZBCornerDemo
//
//  Created by Zuobian on 2019/12/24.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ZBCornerRadiusTool.h"
#import "BezierPathTool.h"

@implementation ZBCornerRadiusTool

/// 绘制裁剪圆角后图片
/// @param radius 圆角
/// @param rectSize 视图尺寸
/// @param fillColor 填充色
/// @param cornerStyle 圆角位置
+ (UIImage *)drawAntiRoundedCornerImageWithRadius:(float)radius rectSize:(CGSize)rectSize fillColor:(UIColor *)fillColor cornerStyle:(UIRectCorner)cornerStyle {
    UIGraphicsBeginImageContextWithOptions(rectSize, false, [UIScreen mainScreen].scale);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [ZBCornerRadiusTool configPathWithBezierPath:&bezierPath Radius:radius rectSize:rectSize cornerStyle:cornerStyle fillColor:fillColor];
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    UIImage *antiRoundedCornerImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return antiRoundedCornerImage;
}


/// 绘制裁剪圆角后图片
/// @param radius_TL 左上角半径
/// @param radius_TR 右上角半径
/// @param radius_BL 左下角半径
/// @param radius_BR 右下角半径
/// @param rectSize 视图尺寸
/// @param fillColor 填充色
+ (UIImage *)drawAntiRoundedCornerWithRadius_TL:(float)radius_TL
                                      radius_TR:(float)radius_TR
                                      radius_BL:(float)radius_BL
                                      radius_BR:(float)radius_BR
                                       rectSize:(CGSize)rectSize
                                      fillColor:(UIColor *)fillColor {
    UIGraphicsBeginImageContextWithOptions(rectSize, false, [UIScreen mainScreen].scale);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [ZBCornerRadiusTool configPathWithBezierPath:&bezierPath radius_TL:radius_TL radius_TR:radius_TR radius_BL:radius_BL radius_BR:radius_BR rectSize:rectSize fillColor:fillColor];
    CGContextDrawPath(contextRef, kCGPathFillStroke);
    UIImage *antiRoundedCornerImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return antiRoundedCornerImage;
}

// 对任意一个或多个角设置圆角
+ (void)configPathWithBezierPath:(UIBezierPath **)bezier Radius:(float)radius rectSize:(CGSize)rectSize cornerStyle:(UIRectCorner)cornerStyle fillColor:(UIColor *)fillColor {
    UIBezierPath *bezierPath = *bezier;
    BezierPathTool *tool = [[BezierPathTool alloc]initWithRadius:radius rectSize:rectSize fillColor:fillColor];
    
    if (cornerStyle == UIRectCornerAllCorners) {
        [tool configAllCornerPoint];
    }else {
        if (cornerStyle == UIRectCornerTopLeft) {
            [tool configTopLeftPoint];
        }
        if (cornerStyle == UIRectCornerTopRight) {
            [tool configTopRightPoint];
        }
        if (cornerStyle == UIRectCornerBottomLeft) {
            [tool configBottomLeftPoint];
        }
        if (cornerStyle == UIRectCornerBottomRight) {
            [tool configBottomRightPoint];
        }
    }
    bezierPath = [tool configCornerBezierPath:bezierPath];
}

// 对四个角分别设置圆角，0即为不进行圆角设置
+ (void)configPathWithBezierPath:(UIBezierPath **)bezier
                       radius_TL:(float)radius_TL
                       radius_TR:(float)radius_TR
                       radius_BL:(float)radius_BL
                       radius_BR:(float)radius_BR
                        rectSize:(CGSize)rectSize
                       fillColor:(UIColor *)fillColor {
    UIBezierPath *bezierPath = *bezier;
    BezierPathTool *tool = [[BezierPathTool alloc]initWithRadius_TopLeft:radius_TL radius_TopRight:radius_TR radius_BottomLeft:radius_BL radius_BottomRight:radius_BR rectSize:rectSize fillColor:fillColor];
    bezierPath = [tool configCornerBezierPath:bezierPath];
}

@end
