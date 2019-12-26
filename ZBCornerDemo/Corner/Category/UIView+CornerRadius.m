//
//  UIView+CornerRadius.m
//  ZBCornerDemo
//
//  Created by Zuobian on 2019/12/24.
//  Copyright © 2019 admin. All rights reserved.
//

#import "UIView+CornerRadius.h"
#import "Masonry.h"
#import "ZBCornerRadiusTool.h"

@implementation UIView (CornerRadius)

- (void)drawCircularBeadImageWithRadius:(float)radius fillColor:(UIColor *)fillColor CornerStyle:(UIRectCorner)type {
    UIImageView *imgView = [[UIImageView alloc] init];
    [self addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.equalTo(self);
    }];
    [self layoutIfNeeded];
    
    imgView.image = [ZBCornerRadiusTool drawAntiRoundedCornerImageWithRadius:radius rectSize:imgView.frame.size fillColor:fillColor cornerStyle:type];
}

- (void)drawCircularBeadImageWithRadius_TL:(float)radius_TL
                             radius_TR:(float)radius_TR
                             radius_BL:(float)radius_BL
                             radius_BR:(float)radius_BR
                             fillColor:(UIColor *)fillColor {
    UIImageView *imgView = [[UIImageView alloc] init];
    [self addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.equalTo(self);
    }];
    [self layoutIfNeeded];
    
    imgView.image = [ZBCornerRadiusTool drawAntiRoundedCornerWithRadius_TL:radius_TL radius_TR:radius_TR radius_BL:radius_BL radius_BR:radius_BR rectSize:imgView.frame.size fillColor:fillColor];
}

@end
