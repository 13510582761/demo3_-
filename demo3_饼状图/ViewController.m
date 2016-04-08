//
//  ViewController.m
//  demo3_饼状图
//
//  Created by jinyong on 16/4/5.
//  Copyright © 2016年 jinyong. All rights reserved.
//

#import "ViewController.h"
#import "myView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    myView* view = [[myView alloc] initWithFrame:CGRectMake(10, 40, 200,200)];
    [view setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:view];
    view.sections = @[@20,@30];
    view.colorSections = @[[UIColor redColor],[UIColor yellowColor]];
}

@end
