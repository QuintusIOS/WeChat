//
//  DetailCell.m
//  WeChat
//
//  Created by LiDan on 15/10/11.
//  Copyright © 2015年 com.lidan. All rights reserved.
//

#import "DetailCell.h"
#import "XMPPvCardTemp.h"
#import "MainNavigationController.h"

@interface DetailCell()
@property (nonatomic,weak) MainNavigationController *oldwindow;
@end

@implementation DetailCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        UIButton *avatar = [[UIButton alloc]init];
        [[avatar layer] setBorderColor:SelfColor(206, 206, 206).CGColor];
        [[avatar layer] setBorderWidth:1.0];
        [[avatar layer] setCornerRadius:5];
        [[avatar layer] setMasksToBounds:YES];
        self.avatar = avatar;
        XMPPvCardTemp *myVCard = [XmppTools sharedXmppTools].vCard.myvCardTemp;
        
        if (myVCard.photo)
        {
            [avatar setBackgroundImage:[UIImage imageWithData:myVCard.photo] forState:UIControlStateNormal];
            avatar.imageView.image = [UIImage imageWithData:myVCard.photo];
        }
        else
        {
            [avatar setBackgroundImage:[UIImage imageNamed:@"DefaultHead"] forState:UIControlStateNormal];
            avatar.imageView.image = [UIImage imageNamed:@"DefaultHead"];
        }
        
        [self addSubview:avatar];
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.avatar.width = 70;
    self.avatar.height = 70;
    self.avatar.x = self.width - 40 - self.avatar.width;
    self.avatar.y = 9;
}

@end
