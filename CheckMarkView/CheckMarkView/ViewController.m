//
//  ViewController.m
//  CheckMarkView
//
//  Created by junge on 15/9/1.
//  Copyright (c) 2015年 junge. All rights reserved.
//

#import "ViewController.h"
#import "CheckMarkView.h"

@interface ViewController ()

@property(nonatomic, strong) CheckMarkView *checkMark;

- (IBAction)show:(id)sender;
- (IBAction)hide:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)show:(id)sender {
    _checkMark = [CheckMarkView initCheckMarkWithFrame:CGRectMake(100, 100, 100, 100) andStrokeColor:nil andDelay:0.5f andLineWidth:5];
    [self.view addSubview:_checkMark];
}

- (IBAction)hide:(id)sender {
    [_checkMark removeFromSuperview];
}
@end
