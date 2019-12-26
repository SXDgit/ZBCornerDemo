//
//  BezierPathTool.m
//  圆角设置测试
//
//  Created by Zuobian on 2019/12/4.
//  Copyright © 2019 admin. All rights reserved.
//

#import "BezierPathTool.h"

@implementation BezierPathTool

- (instancetype)initWithRadius:(float)radius rectSize:(CGSize)rectSize fillColor:(UIColor *)fillColor {
    if (self = [super init]) {
        _radius = radius;
        _rectSize = rectSize;
        _fillColor = fillColor;
        [self configData];
    }
    return self;
}

- (instancetype)initWithRadius_TopLeft:(float)radius_TL
                       radius_TopRight:(float)radius_TR
                     radius_BottomLeft:(float)radius_BL
                    radius_BottomRight:(float)radius_BR
                              rectSize:(CGSize)rectSize
                             fillColor:(UIColor *)fillColor {
    if (self = [super init]) {
        _radius_TopLeft = radius_TL;
        _radius_TopRight = radius_TR;
        _radius_BottomLeft = radius_BL;
        _radius_BottomRight = radius_BR;
        _rectSize = rectSize;
        _fillColor = fillColor;
        [self configCornerPointData];
    }
    return self;
}

- (void)configData {
    _hLeftUpPoint = CGPointMake(0, 0);
    _hRightUpPoint = CGPointMake(_rectSize.width, 0);
    _hLeftDownPoint = CGPointMake(0, _rectSize.height);
    
    _vLeftUpPoint = CGPointMake(0, 0);
    _vRightDownPoint = CGPointMake(_rectSize.width, _rectSize.height);
    
    _centerLeftUp = CGPointMake(0, 0);
    _centerRightUp = CGPointMake(_rectSize.width, 0);
    _centerLeftDown = CGPointMake(0, _rectSize.height);
    _centerRightDown = CGPointMake(_rectSize.width, _rectSize.height);
}

- (void)configCornerPointData {
    [self configTopLeftPoint];
    [self configTopRightPoint];
    [self configBottomLeftPoint];
    [self configBottomRightPoint];
}

- (void)configAllCornerPoint {
    _hLeftUpPoint = CGPointMake(_radius, 0);//（10,0）
    _hRightUpPoint = CGPointMake(_rectSize.width - _radius, 0);//(30,0)
    _hLeftDownPoint = CGPointMake(_radius, _rectSize.height);//(10,40)
    
    _vLeftUpPoint = CGPointMake(0, _radius);//(0,10)
    _vRightDownPoint = CGPointMake(_rectSize.width, _rectSize.height - _radius);//(40,30)
    
    _centerLeftUp = CGPointMake(_radius, _radius);//(10,10)
    _centerRightUp = CGPointMake(_rectSize.width - _radius, _radius);//(30,10)
    _centerLeftDown = CGPointMake(_radius, _rectSize.height - _radius);//(10,30)
    _centerRightDown = CGPointMake(_rectSize.width - _radius, _rectSize.height - _radius);//(30,30)
}

- (void)configTopLeftPoint {
    float radius = _radius_TopLeft ?: _radius;
    _hLeftUpPoint = CGPointMake(radius, 0);//（10,0）
    _vLeftUpPoint = CGPointMake(0, radius);//(0,10)
    _centerLeftUp = CGPointMake(radius, radius);//(10,10)
}

- (void)configTopRightPoint {
    float radius = _radius_TopRight ?: _radius;
    _hRightUpPoint = CGPointMake(_rectSize.width - radius, 0);//(30,0)
    _centerRightUp = CGPointMake(_rectSize.width - radius, radius);//(30,10)
}

- (void)configBottomLeftPoint {
    float radius = _radius_BottomLeft ?: _radius;
    _hLeftDownPoint = CGPointMake(radius, _rectSize.height);//(10,40)
    _centerLeftDown = CGPointMake(radius, _rectSize.height - radius);//(10,30)
}

- (void)configBottomRightPoint {
    float radius = _radius_BottomRight ?: _radius;
    _vRightDownPoint = CGPointMake(_rectSize.width, _rectSize.height - radius);//(40,30)
    _centerRightDown = CGPointMake(_rectSize.width - radius, _rectSize.height - radius);//(30,30)
}

// 绘制贝塞尔曲线
- (UIBezierPath *)configCornerBezierPath:(UIBezierPath *)bezierPath {
    [bezierPath moveToPoint:self.hLeftUpPoint];
    [bezierPath addLineToPoint:self.hRightUpPoint];
    [bezierPath addArcWithCenter:self.centerRightUp radius:self.radius_TopRight ?: self.radius startAngle:(CGFloat)(M_PI * 3 / 2) endAngle:(CGFloat)(M_PI * 2) clockwise: true];
    [bezierPath addLineToPoint:self.vRightDownPoint];
    [bezierPath addArcWithCenter:self.centerRightDown radius:self.radius_BottomRight ?: self.radius startAngle: 0 endAngle: (CGFloat)(M_PI / 2) clockwise: true];
    [bezierPath addLineToPoint:self.hLeftDownPoint];
    [bezierPath addArcWithCenter:self.centerLeftDown radius:self.radius_BottomLeft ?: self.radius startAngle: (CGFloat)(M_PI / 2) endAngle: (CGFloat)(M_PI) clockwise: true];
    [bezierPath addLineToPoint:self.vLeftUpPoint];
    [bezierPath addArcWithCenter:self.centerLeftUp radius:self.radius_TopLeft ?: self.radius startAngle: (CGFloat)(M_PI) endAngle: (CGFloat)(M_PI * 3 / 2) clockwise: true];
    [bezierPath addLineToPoint:self.hLeftUpPoint];
    [bezierPath closePath];
    
    [bezierPath moveToPoint:CGPointZero];
    [bezierPath addLineToPoint:CGPointMake(0, self.rectSize.height)];
    [bezierPath addLineToPoint:CGPointMake(self.rectSize.width, self.rectSize.height)];
    [bezierPath addLineToPoint:CGPointMake(self.rectSize.width, 0)];
    [bezierPath addLineToPoint:CGPointZero];
    [bezierPath closePath];

    [self.fillColor setFill];
    [bezierPath fill];
    return bezierPath;
}

@end
