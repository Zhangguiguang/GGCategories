//
//  UIImage_TintVC.m
//  GGCategories
//
//  Created by 张贵广 on 2017/8/15.
//  Copyright © 2017年 GG. All rights reserved.
//

#import "UIImage_TintVC.h"
#import "UIImage+GGTint.h"
#import "UIImage+GGResize.h"

@interface UIImage_TintVC ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation UIImage_TintVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imageView = [[UIImageView alloc] init];
    _imageView.contentMode = UIViewContentModeCenter;
    _imageView.layer.borderWidth = 2;
    [self.view addSubview:_imageView];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    _imageView.frame = CGRectMake(100, 100, 200, 200);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    UIImage *image = [[UIImage imageNamed:@"icon_man"] gg_tintColor:[UIColor greenColor]];
//    UIImage *image = [[UIImage imageNamed:@"icon_man"] gg_tintColor:[UIColor greenColor] size:CGSizeMake(200, 200)];
//    UIImage *image = [[UIImage imageNamed:@"icon_man"] gg_tintColor:[UIColor greenColor] size:CGSizeMake(20, 20)];
    
//    UIImage *image = [[[UIImage imageNamed:@"icon_man"] gg_tintColor:[UIColor greenColor]] gg_resizeToScale:0.3];
    
//    UIImage *image = [[[UIImage imageNamed:@"icon_selected"] gg_tintColor:[UIColor greenColor]] gg_resizeToSize:CGSizeMake(100, 100)];
    
    UIImage *image = [[[UIImage imageNamed:@"icon_selected"] gg_tintColor:[UIColor purpleColor]] gg_resizeToSize:CGSizeMake(20, 20)];
//    UIImage *image = [[UIImage imageNamed:@"icon_selected"] gg_tintColor:[UIColor purpleColor] size:CGSizeMake(20, 20)];
//    UIImage *image = [[UIImage imageNamed:@"icon_selected"] gg_resizeToSize:CGSizeMake(20, 20)];
    
    _imageView.image = image;
}

@end
