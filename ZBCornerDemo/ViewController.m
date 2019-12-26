//
//  ViewController.m
//  ZBCornerDemo
//
//  Created by Zuobian on 2019/12/24.
//  Copyright © 2019 admin. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UIView+CornerRadius.h"

@interface ViewController ()

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *bgImageView2;
@property (nonatomic, strong) UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view).offset(64);
        make.width.height.equalTo(@100);
    }];
    
    [self.view addSubview:self.bgImageView2];
    [self.bgImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.bgImageView.mas_bottom).offset(64);
        make.width.height.equalTo(@100);
    }];
    
    [self.view addSubview:self.button];
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.bgImageView2.mas_bottom).offset(64);
        make.width.height.equalTo(@100);
    }];
    
    // 设置圆角
    [self.bgImageView drawCircularBeadImageWithRadius:50 fillColor:[UIColor greenColor] CornerStyle:UIRectCornerTopRight];
    [self.bgImageView2 drawCircularBeadImageWithRadius_TL:20 radius_TR:50 radius_BL:10 radius_BR:0 fillColor:[UIColor redColor]];
    [self.button drawCircularBeadImageWithRadius_TL:50 radius_TR:30 radius_BL:10 radius_BR:40 fillColor:[UIColor blueColor]];
    
    
}

- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.image = [UIImage imageNamed:@"headerImage.jpeg"];
    }
    return _bgImageView;
}

- (UIImageView *)bgImageView2 {
    if (!_bgImageView2) {
        _bgImageView2 = [[UIImageView alloc]init];
        _bgImageView2.image = [UIImage imageNamed:@"headerImage.jpeg"];
    }
    return _bgImageView2;
}

- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        [_button setImage:[UIImage imageNamed:@"headerImage.jpeg"] forState:UIControlStateNormal];
    }
    return _button;
}

@end
