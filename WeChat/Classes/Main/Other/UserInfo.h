//
//  UserInfo.h
//  WeChat
//
//  Created by LiDan on 15/10/7.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface UserInfo : NSObject

singleton_interface(UserInfo);

/**账户名*/
@property (nonatomic,copy)NSString *user;

/**密码*/
@property (nonatomic,copy)NSString *pwd;

/**登陆状态*/
@property (nonatomic,assign) BOOL loginStatus;


-(void)loadUserInfoFromSandBox;
-(void)saveuserInfoToSanbox;

@end