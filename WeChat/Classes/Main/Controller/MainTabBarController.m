//
//  MainTabBarController.m
//  WeChat
//
//  Created by LiDan on 15/10/4.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"
#import "MainViewController.h"
#import "ContactController.h"
#import "MeController.h"
#import "FriendsController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    MainViewController *mainVc = [[MainViewController alloc]init];
    [mainVc.view setBackgroundColor:[UIColor redColor]];
    [self addOneChildVc:mainVc title:@"微信" imageName:@"tabbar_mainframe" selectedImageName:@"tabbar_mainframeHL"];
    ContactController *contactVc = [[ContactController alloc]init];
    [contactVc.view setBackgroundColor:[UIColor blueColor]];
    [self addOneChildVc:contactVc title:@"通讯录" imageName:@"tabbar_contacts" selectedImageName:@"tabbar_contactsHL"];
    FriendsController *discoverVc = [[FriendsController alloc]init];
    [discoverVc.view setBackgroundColor:[UIColor yellowColor]];
    [self addOneChildVc:discoverVc title:@"朋友圈" imageName:@"tabbar_discover" selectedImageName:@"tabbar_discoverHL"];
    MeController *meVc = [[MeController alloc]init];
    [meVc.view setBackgroundColor:[UIColor orangeColor]];
    [self addOneChildVc:meVc title:@"我" imageName:@"tabbar_me" selectedImageName:@"tabbar_meHL"];
    [self.tabBar setTintColor:SelfColor(9, 187, 7)];
}

- (void) addOneChildVc:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *) selectedImageName
{
    childVc.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = selectedImage;
    
    MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:childVc];
    
    [self addChildViewController:nav];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
