//
//  MMBAlertView.h
//  MXTradingPlatform
//
//  Created by 金振鲁 on 2019/4/24.
//  Copyright © 2019 liyameng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
/*
 底部button样式
 */
typedef enum MMBAlertBottomButtonType{
    MMBAlertBottomButtonTypeSingle = 1,   //单个button
    MMBAlertBottomButtonTypeDouble    //两个button
}MMBAlertBottomButtonType;

typedef enum MMBAlertStyle{
    MMBAlertStyleDefault = 1,   //默认样式，会随message内容自动拉长
    MMBAlertStyleScrollView    //滚动样式，当message 特别多的时候使用
}MMBAlertStyle;

typedef void (^MMBAlertClickBlock)(void);
typedef void (^MMBAlertCheckButtonClickBlock)(BOOL select);

@interface MMBAlertView : UIView
//标题
@property (nonatomic, strong) NSString *title;
//内容
@property (nonatomic, strong) NSString *message;
//富文本内容（优先显示）
@property (nonatomic, strong) NSMutableAttributedString *attributedMessage;
//是否显示 "不再提醒" 选框 默认显示
@property (nonatomic, assign) BOOL showCheck;
//自定义底部button 名称
@property (nonatomic, strong) NSString *leftButtonTitle;
@property (nonatomic, strong) NSString *rightButtonTitle;
@property (nonatomic, strong) NSString *singleButtonTitle;
//底部按钮样式  默认两个按钮
@property (nonatomic, assign) MMBAlertBottomButtonType bottomButton_type;
//底部button点击回调
@property (nonatomic, assign) MMBAlertClickBlock leftButtonBlock;
@property (nonatomic, assign) MMBAlertClickBlock rightButtonBlock;
@property (nonatomic, assign) MMBAlertClickBlock singleButtonBlock;
//不再提醒 选框点击回调
@property (nonatomic, assign) MMBAlertCheckButtonClickBlock checkButtonBlock;

- (instancetype)initWithAlertStyle:(MMBAlertStyle)style;
- (void)show;

@end

NS_ASSUME_NONNULL_END
