//
//  ViewController.m
//  text4
//
//  Created by  周保勇 on 15/10/8.
//  Copyright (c) 2015年  周保勇. All rights reserved.
//

#import "ViewController.h"
#import <MyFramework/Mytool.h>
#import <MyFramework/MyFramework.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *MyImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyyMMDD"];
    NSString * dateStr = [dateformatter stringFromDate:[NSDate date]];
    NSLog(@"%@",dateStr);
    NSLog(@"%f",[Mytool sumWithNumber1:10.5 andNumber2:11]);
//    self.MyImageView.image = [Mytool imageWithName:@"1.png"];
    UIImage *  image = [Mytool imageWithName:@"1.png"];
    self.MyImageView.image = image;
    [UIView animateWithDuration:1.0 animations:^{
        NSLog(@"33");
    }];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"SynjonesCloudPlat://"]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
