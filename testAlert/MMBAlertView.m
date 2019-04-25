//
//  MMBAlertView.m
//  MXTradingPlatform
//
//  Created by 金振鲁 on 2019/4/24.
//  Copyright © 2019 liyameng. All rights reserved.
//

#import "MMBAlertView.h"
#import "Masonry/Masonry.h"

#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)
#define Application_Keywindow [UIApplication sharedApplication].keyWindow

@interface MMBAlertView ()
@property (nonatomic, strong) UIView *container_view;
@property (nonatomic, strong) UILabel *labTitle;
@property (nonatomic, strong) UILabel *labContent;
@property (nonatomic, strong) UIButton *btnCheck;
@property (nonatomic, strong) UILabel *labNotShow;
@property (nonatomic, strong) UIButton *btnCancel;
@property (nonatomic, strong) UIButton *btnDone;
@property (nonatomic, strong) UIButton *btnSingle;

@property (nonatomic, strong) UITextView *txtView;
@property (nonatomic, assign) MMBAlertStyle style;

@end

@implementation MMBAlertView

- (instancetype)initWithAlertStyle:(MMBAlertStyle)style{
    self = [super init];
    if (self) {
        _style = style;
        [self initilize];
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        _style = MMBAlertStyleDefault;
        [self initilize];
    }
    return self;
}

- (void)show{
    [Application_Keywindow addSubview:self];
}

- (void)dismiss{
    [self removeFromSuperview];
}

- (void)setTitle:(NSString *)str{
    _title = str;
    _labTitle.text = _title;
}

- (void)setMessage:(NSString *)str{
    _message = str;
    if (_attributedMessage.length == 0) {
        if (_style == MMBAlertStyleScrollView) {
            _txtView.text = _message;
        }else{
            _labContent.text = _message;
        }
    }
}

- (void)setAttributedMessage:(NSMutableAttributedString *)attributedStr{
    _attributedMessage = attributedStr;
    if (_style == MMBAlertStyleScrollView) {
        _txtView.attributedText = _attributedMessage;
    }else{
        _labContent.attributedText = _attributedMessage;
    }
}

- (void)setShowCheck:(BOOL)show{
    _showCheck = show;
    if (_showCheck) {
        _btnCheck.hidden = NO;
        _labNotShow.hidden = NO;
        if (_style == MMBAlertStyleScrollView) {
            [_txtView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(_btnCheck.mas_top).offset(-20);
            }];
        }else{
            [_labContent mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(_btnCheck.mas_top).offset(-20);
            }];
        }
    }else{
        _btnCheck.hidden = YES;
        _labNotShow.hidden = YES;
        if (_style == MMBAlertStyleScrollView) {
            [_txtView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(_btnDone.mas_top).offset(-20);
            }];
            [_btnCheck mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }else{
            [_labContent mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(_btnDone.mas_top).offset(-20);
            }];
            [_btnCheck mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }
    }
}

- (void)setBottomButton_type:(MMBAlertBottomButtonType)type{
    _bottomButton_type = type;
    if (type == MMBAlertBottomButtonTypeSingle) {
        _btnDone.hidden = YES;
        _btnCancel.hidden = YES;
        _btnSingle.hidden = NO;
    }else{
        _btnDone.hidden = NO;
        _btnCancel.hidden = NO;
        _btnSingle.hidden = YES;
    }
}

- (void)setLeftButtonTitle:(NSString *)leftTitle{
    _leftButtonTitle = leftTitle;
    [_btnCancel setTitle:_leftButtonTitle forState:UIControlStateNormal];
}

- (void)setRightButtonTitle:(NSString *)rightTitle{
    _rightButtonTitle = rightTitle;
    [_btnDone setTitle:_rightButtonTitle forState:UIControlStateNormal];
}

- (void)setSingleButtonTitle:(NSString *)singleTitle{
    _singleButtonTitle = singleTitle;
    [_btnSingle setTitle:_singleButtonTitle forState:UIControlStateNormal];
}

- (void)setLeftButtonBlock:(MMBAlertClickBlock)leftBlock{
    _leftButtonBlock = leftBlock;
}

- (void)setRightButtonBlock:(MMBAlertClickBlock)rightBlock{
    _rightButtonBlock = rightBlock;
}

- (void)setSingleButtonBlock:(MMBAlertClickBlock)singleBlock{
    _singleButtonBlock = singleBlock;
}

- (void)setCheckButtonBlock:(MMBAlertCheckButtonClickBlock)checkBlock{
    _checkButtonBlock = checkBlock;
}

- (void)initilize{
    self.backgroundColor = RGBA(0, 0, 0, 0.5);
    self.frame = Application_Keywindow.bounds;
    
    _container_view = [[UIView alloc] init];
    _container_view.backgroundColor = [UIColor whiteColor];
    [_container_view.layer setMasksToBounds:YES];
    _container_view.layer.cornerRadius = 5;
    [self addSubview:_container_view];
    if (_style == MMBAlertStyleScrollView) {
        [_container_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(20);
            make.right.mas_equalTo(self).offset(-20);
            make.top.mas_equalTo(self).offset(64);
            make.bottom.mas_equalTo(self).offset(-50);
        }];
    }else{
        [_container_view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(20);
            make.right.mas_equalTo(self).offset(-20);
            make.centerY.mas_equalTo(self);
            make.top.mas_greaterThanOrEqualTo(self).offset(64);
            make.bottom.mas_lessThanOrEqualTo(self).offset(-50);
        }];
    }
    
    _labTitle = [[UILabel alloc] init];
    _labTitle.font = [UIFont systemFontOfSize:17];
    _labTitle.textAlignment = NSTextAlignmentCenter;
    [_container_view addSubview:_labTitle];
    
    [_labTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(_container_view).offset(15);
        make.height.mas_equalTo(30);
        make.right.mas_equalTo(_container_view).offset(-15);
    }];
    
    _btnCancel = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnCancel.layer setMasksToBounds:YES];
    _btnCancel.layer.cornerRadius = 5;
    _btnCancel.layer.borderWidth = 0.5;
    _btnCancel.layer.borderColor = RGB(41, 146, 227).CGColor;
    [_btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    [_btnCancel setTitleColor:RGB(41, 146, 227) forState:UIControlStateNormal];
    [_container_view addSubview:_btnCancel];
    [_btnCancel addTarget:self action:@selector(btnCancelClick) forControlEvents:UIControlEventTouchUpInside];
    [_btnCancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_container_view).offset(-30);
        make.right.mas_equalTo(_container_view.mas_centerX).offset(-20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(35);
    }];
    
    _btnDone = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnDone.layer setMasksToBounds:YES];
    _btnDone.layer.cornerRadius = 5;
    _btnDone.backgroundColor = RGB(41, 146, 227);
    [_btnDone setTitle:@"确定" forState:UIControlStateNormal];
    [_btnDone setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_container_view addSubview:_btnDone];
    [_btnDone addTarget:self action:@selector(btnDoneClick) forControlEvents:UIControlEventTouchUpInside];
    [_btnDone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_container_view).offset(-30);
        make.left.mas_equalTo(_container_view.mas_centerX).offset(20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(35);
    }];
    
    _btnSingle = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnSingle setTitle:@"知道了" forState:UIControlStateNormal];
    [_btnSingle.layer setMasksToBounds:YES];
    _btnSingle.layer.cornerRadius = 5;
    [_btnSingle setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _btnSingle.backgroundColor = RGB(41, 146, 227);
    [_container_view addSubview:_btnSingle];
    [_btnSingle addTarget:self action:@selector(btnSingleClick) forControlEvents:UIControlEventTouchUpInside];
    [_btnSingle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(_container_view).offset(-30);
        make.centerX.mas_equalTo(_container_view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(35);
    }];
    _btnSingle.hidden = YES;
    
    _btnCheck = [UIButton buttonWithType:UIButtonTypeCustom];
    [_btnCheck setImage:[UIImage imageNamed:@"danxuan"] forState:UIControlStateNormal];
    [_btnCheck setImage:[UIImage imageNamed:@"danxuan_xuanzhong"] forState:UIControlStateSelected];
    [_container_view addSubview:_btnCheck];
    [_btnCheck addTarget:self action:@selector(btnCheckClick) forControlEvents:UIControlEventTouchUpInside];
    
    [_btnCheck mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_container_view).offset(20);
        make.height.width.mas_equalTo(20);
        make.bottom.mas_equalTo(_btnCancel.mas_top).offset(-20);
    }];
    
    _labNotShow = [[UILabel alloc] init];
    _labNotShow.text = @"以后不再显示";
    _labNotShow.font = [UIFont systemFontOfSize:13];
    _labNotShow.textColor = [UIColor darkGrayColor];
    [_container_view addSubview:_labNotShow];
    [_labNotShow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_btnCheck.mas_right).offset(8);
        make.centerY.mas_equalTo(_btnCheck.mas_centerY);
    }];
    
    if (_style == MMBAlertStyleScrollView) {
        _txtView = [[UITextView alloc] init];
        _txtView.editable = NO;
        _txtView.font = [UIFont systemFontOfSize:14];
        _txtView.textColor = [UIColor darkGrayColor];
        [_container_view addSubview:_txtView];
        [_txtView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_container_view).offset(15);
            make.right.mas_equalTo(_container_view).offset(-15);
            make.top.mas_equalTo(_labTitle.mas_bottom).offset(10);
            make.bottom.mas_equalTo(_btnCheck.mas_top).offset(-20);
        }];
    }else{
        _labContent = [[UILabel alloc] init];
        _labContent.font = [UIFont systemFontOfSize:14];
        _labContent.textColor = [UIColor darkGrayColor];
        _labContent.numberOfLines = 0;
        [_container_view addSubview:_labContent];
        
        [_labContent mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_container_view).offset(20);
            make.right.mas_equalTo(_container_view).offset(-20);
            make.top.mas_equalTo(_labTitle.mas_bottom).offset(10);
            make.bottom.mas_equalTo(_btnCheck.mas_top).offset(-20);
        }];
    }
}

- (void)btnCheckClick{
    _btnCheck.selected = !_btnCheck.selected;
    if (self.checkButtonBlock) {
        self.checkButtonBlock(_btnCheck.selected);
    }
}

- (void)btnDoneClick{
    [self dismiss];
    if (self.rightButtonBlock) {
        self.rightButtonBlock();
    }
}

- (void)btnCancelClick{
    [self dismiss];
    if (self.leftButtonBlock) {
        self.leftButtonBlock();
    }
}

- (void)btnSingleClick{
    [self dismiss];
    if (self.singleButtonBlock) {
        self.singleButtonBlock();
    }
}

@end
