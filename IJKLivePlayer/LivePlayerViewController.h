//
//  LivePlayerViewController.h
//  PolyvIJKLivePlayer
//
//  Created by ftao on 2016/12/14.
//  Copyright © 2016年 easefun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <PLVLiveAPI/PLVLiveAPI.h>

@interface LivePlayerViewController : UIViewController

@property (nonatomic, strong) PLVChannel *channel;

@end