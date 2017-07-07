//
//  ViewController.m
//  文字转语音
//
//  Created by 大虾咪 on 2017/7/7.
//  Copyright © 2017年 大虾咪. All rights reserved.
//

#import "ViewController.h"
#import "TmfSpeakTool.h"
@interface ViewController ()

@end

@implementation ViewController
{
    TmfSpeakTool *tool;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    tool = [[TmfSpeakTool alloc] init];

    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(100, 10, 80, 80);
    button.backgroundColor = [UIColor grayColor];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    UIButton *pauseButton = [[UIButton alloc] init];
    pauseButton.frame = CGRectMake(100, 100, 80, 80);
    [pauseButton setTitle:@"暂停" forState:UIControlStateNormal];
    [pauseButton setTitle:@"播放" forState:UIControlStateSelected];
    [pauseButton addTarget:self action:@selector(pauseButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    pauseButton.backgroundColor = [UIColor grayColor];
    [self.view addSubview:pauseButton];

   
}
- (void)btnAction {
    [tool transtoVoiceWithString:@"刘宏亮和梦琪有一腿"];
}

- (void)pauseButtonAction:(UIButton *)btn {
    
    btn.selected = !btn.selected;
    
    [tool pauseAv];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
