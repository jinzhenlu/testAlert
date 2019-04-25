//
//  ViewController.m
//  testAlert
//
//  Created by 金振鲁 on 2019/4/24.
//  Copyright © 2019 xiaojin. All rights reserved.
//

#import "ViewController.h"
#import "MMBAlertView.h"

@interface ViewController ()
- (IBAction)btnClick:(id)sender;
- (IBAction)btnClick2:(id)sender;
- (IBAction)btnClick3:(id)sender;
- (IBAction)btnClick4:(id)sender;
- (IBAction)btnClick5:(id)sender;
- (IBAction)btnClick6:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)btnClick:(id)sender{
    MMBAlertView *alert = [[MMBAlertView alloc] init];
    alert.title = @"电话咨询提示";
    NSString *string = @"确认要通过电话咨询本商品吗？\n\n对方接通电话后，提示对方在通话中打开APP，此时您咨询的商品将置顶显示。（对方限安卓手机）\n\n注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）";
    alert.message = string;
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = [string rangeOfString:@"（对方限安卓手机）"];
    NSRange range1 = [string rangeOfString:@"注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）"];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range1];
    alert.attributedMessage = attString;
//    alert.showCheck = YES;
    [alert show];
    alert.leftButtonBlock = ^{
        NSLog(@"cancel");
    };
    alert.rightButtonBlock = ^{
        NSLog(@"done");
    };
}
- (void)btnClick2:(id)sender{
    MMBAlertView *alert = [[MMBAlertView alloc] initWithAlertStyle:MMBAlertStyleDefault];
    alert.title = @"电话咨询提示";
    NSString *string = @"确认要通过电话咨询本商品吗？\n\n对方接通电话后，提示对方在通话中打开APP，此时您咨询的商品将置顶显示。（对方限安卓手机）\n\n注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）";
    alert.message = string;
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = [string rangeOfString:@"（对方限安卓手机）"];
    NSRange range1 = [string rangeOfString:@"注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）"];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range1];
    alert.attributedMessage = attString;
    alert.bottomButton_type = MMBAlertBottomButtonTypeSingle;
    //    alert.showCheck = YES;
    [alert show];
    alert.leftButtonBlock = ^{
        NSLog(@"cancel");
    };
    alert.rightButtonBlock = ^{
        NSLog(@"done");
    };
}

- (void)btnClick3:(id)sender{
    MMBAlertView *alert = [[MMBAlertView alloc] initWithAlertStyle:MMBAlertStyleDefault];
    alert.title = @"电话咨询提示";
    NSString *string = @"确认要通过电话咨询本商品吗？\n\n对方接通电话后，提示对方在通话中打开APP，此时您咨询的商品将置顶显示。（对方限安卓手机）\n\n注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）";
    alert.message = string;
//    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
//    NSRange range = [string rangeOfString:@"（对方限安卓手机）"];
//    NSRange range1 = [string rangeOfString:@"注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）"];
//    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range];
//    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range1];
//    alert.attributedMessage = attString;
    alert.showCheck = NO;
    [alert show];
    alert.leftButtonBlock = ^{
        NSLog(@"cancel");
    };
    alert.rightButtonBlock = ^{
        NSLog(@"done");
    };
}

- (void)btnClick4:(id)sender{
    MMBAlertView *alert = [[MMBAlertView alloc] initWithAlertStyle:MMBAlertStyleScrollView];
    alert.title = @"电话咨询提示";
    NSString *string = @"确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n对方接通电话后，提示对方在通话中打开APP，此时您咨询的商品将置顶显示。（对方限安卓手机）\n\n注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）";
    alert.message = string;
//    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
//    NSRange range = [string rangeOfString:@"（对方限安卓手机）"];
//    NSRange range1 = [string rangeOfString:@"注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）"];
//    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range];
//    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range1];
//    alert.attributedMessage = attString;
    //    alert.showCheck = YES;
    [alert show];
    alert.leftButtonBlock = ^{
        NSLog(@"cancel");
    };
    alert.rightButtonBlock = ^{
        NSLog(@"done");
    };
}

- (void)btnClick5:(id)sender{
    MMBAlertView *alert = [[MMBAlertView alloc] initWithAlertStyle:MMBAlertStyleScrollView];
    alert.title = @"电话咨询提示";
    NSString *string = @"确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n对方接通电话后，提示对方在通话中打开APP，此时您咨询的商品将置顶显示。（对方限安卓手机）\n\n注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）";
    alert.message = string;
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = [string rangeOfString:@"（对方限安卓手机）"];
    NSRange range1 = [string rangeOfString:@"注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）"];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range1];
    alert.attributedMessage = attString;
    alert.bottomButton_type = MMBAlertBottomButtonTypeSingle;
//    alert.showCheck = NO;
    [alert show];
    alert.leftButtonBlock = ^{
        NSLog(@"cancel");
    };
    alert.rightButtonBlock = ^{
        NSLog(@"done");
    };
}

- (void)btnClick6:(id)sender{
    MMBAlertView *alert = [[MMBAlertView alloc] initWithAlertStyle:MMBAlertStyleScrollView];
    alert.title = @"电话咨询提示";
    NSString *string = @"确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n确认要通过电话咨询本商品吗？\n\n对方接通电话后，提示对方在通话中打开APP，此时您咨询的商品将置顶显示。（对方限安卓手机）\n\n注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）";
    alert.message = string;
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = [string rangeOfString:@"（对方限安卓手机）"];
    NSRange range1 = [string rangeOfString:@"注：对方APP至少在后台运行的情况下接听电话才会置顶。否则无法置顶（对方经常使用即可）"];
    [attString addAttributes:@{NSForegroundColorAttributeName:[UIColor darkGrayColor],NSFontAttributeName:[UIFont systemFontOfSize:14]} range:NSMakeRange(0, string.length)];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:range1];
    alert.attributedMessage = attString;
    alert.showCheck = NO;
    [alert show];
    alert.leftButtonBlock = ^{
        NSLog(@"cancel");
    };
    alert.rightButtonBlock = ^{
        NSLog(@"done");
    };
}


@end
