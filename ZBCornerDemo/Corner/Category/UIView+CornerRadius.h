//
//  UIView+CornerRadius.h
//  ZBCornerDemo
//
//  Created by Zuobian on 2019/12/24.
//  Copyright © 2019 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (CornerRadius)


/// 绘制裁剪圆角，可选任意角进行切割
/// @param radius 圆角半径
/// @param fillColor 填充色
/// @param type 裁剪角
- (void)drawCircularBeadImageWithRadius:(float)radius fillColor:(UIColor *)fillColor CornerStyle:(UIRectCorner)type;

/// 绘制裁剪圆角，可选任意角进行切割，且每个角可选切割任意半径
/// @param radius_TL 左上角半径
/// @param radius_TR 右上角半径
/// @param radius_BL 左下角半径
/// @param radius_BR 右下角半径
/// @param fillColor 填充色
- (void)drawCircularBeadImageWithRadius_TL:(float)radius_TL
                                 radius_TR:(float)radius_TR
                                 radius_BL:(float)radius_BL
                                 radius_BR:(float)radius_BR
                                 fillColor:(UIColor *)fillColor;

@end

NS_ASSUME_NONNULL_END
