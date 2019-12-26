//
//  ZBCornerRadiusTool.h
//  ZBCornerDemo
//
//  Created by Zuobian on 2019/12/24.
//  Copyright © 2019 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZBCornerRadiusTool : NSObject

/// 绘制裁剪圆角后图片
/// @param radius 圆角
/// @param rectSize 视图尺寸
/// @param fillColor 填充色
/// @param cornerStyle 圆角位置
+ (UIImage *)drawAntiRoundedCornerImageWithRadius:(float)radius rectSize:(CGSize)rectSize fillColor:(UIColor *)fillColor cornerStyle:(UIRectCorner)cornerStyle;

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
                                      fillColor:(UIColor *)fillColor;

@end

NS_ASSUME_NONNULL_END
