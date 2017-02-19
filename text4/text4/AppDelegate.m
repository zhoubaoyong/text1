//
//  AppDelegate.m
//  text4
//
//  Created by  周保勇 on 15/10/8.
//  Copyright (c) 2015年  周保勇. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
/**
 *  启动图片视图的懒加载
 *
 *  @return 返回启动图片视图
 */
- (UIImageView *)splashView
{
    if (_splashView == nil) {
        _splashView = [[UIImageView alloc] initWithFrame:self.window.bounds];
        _splashView.image = [UIImage imageNamed:@"back.jpg"];
    }
    return _splashView;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self.window makeKeyAndVisible];
    
    [self.window addSubview:self.splashView];
    [self.window bringSubviewToFront:self.splashView];
    
    [self performSelector:@selector(scale_1) withObject:self afterDelay:1.0];
    [self performSelector:@selector(showText) withObject:self afterDelay:1.0];
    
    return YES;
}
/**
 *  第一个动画
 *
 *  @param application <#application description#>
 */
- (void)scale_1
{
    UIImageView *round_1 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 240, 100, 100)];
    round_1.image = [UIImage imageNamed:@"sheep.jpg"];
    [self.splashView addSubview:round_1];
    [self setAnimation:round_1];
}
/**
 *  动画
 *
 *  @param application <#application description#>
 */
- (void)setAnimation:(UIImageView *)imageView
{
    [UIView animateWithDuration:1.0 animations:^{
        [imageView setFrame:CGRectMake(0, 0, 0, 0)];
    } completion:^(BOOL finished) {
        [imageView removeFromSuperview];
    }];
}
- (void)showText
{
    UILabel *word_ = [[UILabel alloc]initWithFrame:CGRectMake(75, 440, 170, 29)];
    word_.text = @"用心，记录每一天！";
    word_.textColor = [UIColor redColor];
    [self.splashView addSubview:word_];
    
    word_.alpha = 0.0;
    [UIView animateWithDuration:1.0f delay:0.0f options:UIViewAnimationOptionCurveLinear
                     animations:^
     {
         word_.alpha = 1.0;
     }
                     completion:^(BOOL finished)
     {
         // 完成后执行code
         [NSThread sleepForTimeInterval:1.0f];
         [self.splashView removeFromSuperview];
     }
     ];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
