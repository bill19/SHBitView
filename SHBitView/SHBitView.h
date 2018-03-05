//
//  SHBitView.h
//  SHBitView
//
//  Created by HaoSun on 2018/3/5.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import <UIKit/UIKit.h>

static CGFloat const kBitViewHeight = 40.0f;

@protocol SHBitViewDelegate <NSObject>
/**
 点击右边的按钮

 @param index 点击了哪个按钮
 */
- (void)bitViewDidClickIndex:(NSInteger)index;
@end

@interface SHBitView : UIView
/**所有需要加载的图片 +  加载 几张图片就是加载几个按钮*/
@property (nonatomic, strong) NSArray <NSString *> *imageNames;

/**所允许存在的最大文字数目 100/500 其中的500*/
@property (nonatomic, assign) NSInteger maxWordCount;

/** 更新文字数目 100/500 其中的100*/
@property (nonatomic, assign) NSInteger updataWord;

/**代理事件*/
@property (nonatomic, weak) id <SHBitViewDelegate>delegate;

@end
