//
//  OtherWayLogin.m
//  WeChat
//
//  Created by LiDan on 15/10/7.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "OtherWayLogin.h"
#import "AppDelegate.h"
#import "MainTabBarController.h"
#import "UserInfo.h"

@interface OtherWayLogin()
@property (nonatomic,weak) UIImageView *iCon;
@property (nonatomic,weak) UITextField *userName;
@property (nonatomic,weak) UITextField *password;
@property (nonatomic,weak) UIButton *login_Btn;
@property (nonatomic,weak) UIButton *register_Btn;
@end


@implementation OtherWayLogin
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImageView *iCon = [[UIImageView alloc]init];
        iCon.image = [UIImage imageNamed:@"DefaultProfileHead_phone"];
        self.iCon = iCon;
        
        UITextField *userName = [[UITextField alloc]init];
        userName.placeholder = @"请输入用户名";
        userName.layer.borderWidth = 1.0f;
        userName.layer.cornerRadius = 5;
        userName.layer.borderColor = SelfColor(56, 56, 56).CGColor;
        userName.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
        userName.leftViewMode = UITextFieldViewModeAlways;
        self.userName = userName;
        
        UITextField *password = [[UITextField alloc]init];
        password.placeholder = @"请输入密码";
        password.secureTextEntry = YES;
        password.layer.borderWidth = 1.0f;
        password.layer.cornerRadius = 5;
        password.layer.borderColor = SelfColor(56, 56, 56).CGColor;
        password.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
        password.leftViewMode = UITextFieldViewModeAlways;
        self.password = password;
        
        UIButton *login_Btn = [[UIButton alloc]init];
        [login_Btn setTitle:@"登陆" forState:UIControlStateNormal];
        [login_Btn setBackgroundImage:[UIImage resizeImageWihtImageName:@"fts_green_btn"] forState:UIControlStateNormal];
        [login_Btn addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
        self.login_Btn = login_Btn;
        
        
        UIButton *register_Btn = [[UIButton alloc]init];
        [register_Btn setTitle:@"没有账号？点击注册" forState:UIControlStateNormal];
        [register_Btn setBackgroundColor:[UIColor clearColor]];
        [register_Btn setTitleColor:[UIColor colorWithRed:105/255.0 green:177/255.0 blue:250/255.0 alpha:1]forState:UIControlStateNormal];
        register_Btn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
        self.register_Btn= register_Btn;
        
        [self addSubview:iCon];
        [self addSubview:userName];
        [self addSubview:password];
        [self addSubview:login_Btn];
        [self addSubview:register_Btn];
    }
    return self;
}

-(void)loginClick
{
    
    UserInfo *userInfo = [UserInfo sharedUserInfo];
    
    userInfo.user = self.userName.text;
    userInfo.pwd = self.password.text;
    
    [MBProgressHUD showMessage:@"正在登陆中..." toView:self.superview];
    AppDelegate *app = [UIApplication sharedApplication].delegate;
    __weak typeof (self) selfVc = self;
    
    [self endEditing:YES];
    [app userLogin:^(XMPPResultType type) {
        [selfVc handleResultType:type];
    }];
    
}

-(void)handleResultType:(XMPPResultType) type
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUD];
        switch (type) {
            case XMPPResultTypeLoginSuccess:
            {
                [self enterMainController];
                break;
            }
            case XMPPResultTypeLoginFailure:
            {
                [MBProgressHUD showError:@"用户名或密码不正确"];
                break;
            }
            case XMPPResultTypeNetErr:
            {
                [MBProgressHUD showError:@"网络有问题"];
            }
            default:
                break;
        }
    });
    
}

-(void)enterMainController
{
    [UserInfo sharedUserInfo].loginStatus = YES;
    
    [UserInfo sharedUserInfo].saveuserInfoToSanbox;
    //来到主界面
    MainTabBarController *tabBarController = [[MainTabBarController alloc]init];
    [self.window.rootViewController dismissViewControllerAnimated:NO completion:nil];
    [self.window.rootViewController presentViewController:tabBarController animated:YES completion:nil];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.iCon.width = 100;
    self.iCon.height = 100;
    self.iCon.x =  (self.width - self.iCon.width) / 2;
    self.iCon.y = 80;
    
    self.userName.width = 255;
    self.userName.height = 40;
    self.userName.x = (self.width - self.userName.width) / 2;
    self.userName.y = self.iCon.y + self.iCon.height + 10;
    
    self.password.width = self.userName.width;
    self.password.height = 40;
    self.password.x = (self.width - self.password.width) / 2;
    self.password.y = self.userName.y + self.userName.height + 10;
    
    self.login_Btn.width = self.userName.width;
    self.login_Btn.height = 40;
    self.login_Btn.x = (self.width - self.login_Btn.width) / 2;
    self.login_Btn.y = self.password.y + self.password.height + 10;
    
    self.register_Btn.width = self.userName.width;
    self.register_Btn.height = 40;
    self.register_Btn.x = (self.width - self.register_Btn.width) / 2;
    self.register_Btn.y = self.height * 0.9;
    
}
@end