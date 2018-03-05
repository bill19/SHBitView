//
//  SHBitView.m
//  SHBitView
//
//  Created by HaoSun on 2018/3/5.
//  Copyright © 2018年 SHKIT. All rights reserved.
//

#import "SHBitView.h"
static CGFloat const itemWidth = 40.0f;
static CGFloat const itemPadding   = 5.0f;
@interface SHBitView()

@property (nonatomic, weak) UIView *bitItemsView;

@property (nonatomic, weak) UILabel *showNumberLabel;

@end

@implementation SHBitView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupSubviews];
    }
    return self;
}
- (void)setupSubviews {
    // 2.提示 用户 还可以输入多少字
    UILabel *showNumberLabel = [[UILabel alloc] init];
    showNumberLabel.frame = CGRectMake(itemPadding, itemPadding, [UIScreen mainScreen].bounds.size.width * 0.25, itemWidth);
    showNumberLabel.text = [NSString stringWithFormat:@"0 / %ld",self.maxWordCount];
    showNumberLabel.font = [UIFont systemFontOfSize:12];
    showNumberLabel.textColor = [UIColor lightGrayColor];
    showNumberLabel.textAlignment = NSTextAlignmentLeft;
    _showNumberLabel = showNumberLabel;
    [self addSubview:_showNumberLabel];

    UIView *bitItemsView = [[UIView alloc] init];
    bitItemsView.frame = CGRectMake(CGRectGetMaxX(_showNumberLabel.frame), 0, [UIScreen mainScreen].bounds.size.width * 0.75, kBitViewHeight);
    bitItemsView.backgroundColor = [UIColor whiteColor];
    bitItemsView.userInteractionEnabled = YES;
    _bitItemsView = bitItemsView;
    [self addSubview:_bitItemsView];
}


- (void)setMaxWordCount:(NSInteger)maxWordCount {
    _maxWordCount = maxWordCount;
    _showNumberLabel.text = [NSString stringWithFormat:@" 0 / %ld",self.maxWordCount];
}

- (void)setUpdataWord:(NSInteger)updataWord {
    _updataWord = updataWord;
    _showNumberLabel.text = [NSString stringWithFormat:@"%ld / %ld",self.updataWord,self.maxWordCount];
}

- (void)setImageNames:(NSArray<NSString *> *)imageNames {
    _imageNames = imageNames;
    /*前面的距离*/
    CGFloat spaceItem = [UIScreen mainScreen].bounds.size.width * 0.75 - itemWidth * _imageNames.count - 10.0f;
    for (NSInteger index = 0; index < _imageNames.count; index ++) {
        int R = (arc4random() % 256) ;
        int G = (arc4random() % 256) ;
        int B = (arc4random() % 256) ;
        UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
        itemButton.tag = index;
        itemButton.userInteractionEnabled = YES;
        itemButton.frame = CGRectMake(itemWidth * index + spaceItem, itemPadding, itemWidth, itemWidth);
        [itemButton setImage:[UIImage imageNamed:self.imageNames[index]] forState:UIControlStateNormal];
        [itemButton addTarget:self action:@selector(picClick:) forControlEvents:UIControlEventTouchUpInside];
        [itemButton setBackgroundColor:[UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1]];
        [itemButton setTitle:[NSString stringWithFormat:@"%ld",index] forState:UIControlStateNormal];
        [_bitItemsView addSubview:itemButton];
    }
}

- (void)picClick:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(bitViewDidClickIndex:)]) {
        [self.delegate bitViewDidClickIndex:sender.tag];
    }
}
@end
