//
//  ViewController.m
//  TableViewFloat
//
//  Created by 李雪阳 on 2018/8/28.
//  Copyright © 2018年 singularity. All rights reserved.
//

#import "ViewController.h"
#import "FloatHeader.h"
#import "FloatViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor=[UIColor whiteColor];
    
    UIButton *btn=[CustomTools buttonWithTitle:@"tableView悬停" font:14 titleColor:[UIColor blueColor] Selector:@selector(skipClick) Target:self];
    btn.frame=CGRectMake(0, 100, SCREEN_WIDTH, 50);
    btn.backgroundColor=[UIColor colorWithHexString:@"dddddd"];
    [self.view addSubview:btn];
}


- (void)skipClick{
    [self.navigationController pushViewController:[FloatViewController new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
