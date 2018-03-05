//
//  ViewController.m
//  SHBitView
//
//  Created by HaoSun on 2018/3/5.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "ViewController.h"
#import "SHBitView.h"
@interface ViewController ()<SHBitViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SHBitView *view = [[SHBitView alloc] init];
    view.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, kBitViewHeight);
    view.maxWordCount = 500;
    view.imageNames = @[@"circle_send_selectImage",@"circle_send_selectImage",@"circle_send_selectImage",@"circle_send_selectImage",@"circle_send_selectImage",@"circle_send_selectImage"];
    view.delegate = self;
    [self.view addSubview:view];
}


/**
 点击右边的按钮

 @param index 点击了哪个按钮
 */
- (void)bitViewDidClickIndex:(NSInteger)index {

    NSLog(@"----%ld",index);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
