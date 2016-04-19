//
//  ViewController.m
//  segmentControl
//
//  Created by admin on 16/4/19.
//  Copyright © 2016年 chunyu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setHeadArray:@[@"手工记录",@"智能药箱"]];
    
    [self setHeaderScrollView];
    
    [self setChildrenVC];
    
    
}

- (void)setHeadArray:(NSArray *)headArray{
    _headArray = [headArray copy];
}

- (void)setHeaderScrollView{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.headerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 40)];
    self.headerScrollView.backgroundColor = [UIColor redColor];
    self.headerScrollView.contentSize = CGSizeMake(320, 64);
    self.headerScrollView.bounces = NO;
    [self.view addSubview:self.headerScrollView];
    for (int i = 0; i < self.headArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(0+i*self.view.bounds.size.width / self.headArray.count, 0, self.view.bounds.size.width / self.headArray.count, 40);
        [button setTitle:[self.headArray objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        button.tag = i + 100;
        [button addTarget:self action:@selector(didClickButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.headerScrollView addSubview:button];
    }
}

- (void)setChildrenVC{
    self.shougongVC = [[UIViewController alloc] init];
    _shougongVC.view.backgroundColor = [UIColor redColor];
    [self.shougongVC.view setFrame:CGRectMake(0, 100, self.view.bounds.size.width, 460)];
    [self addChildViewController:_shougongVC];
    
    self.zhinengVC = [[UIViewController alloc] init];
    _zhinengVC.view.backgroundColor = [UIColor blueColor];
    [self.zhinengVC.view setFrame:CGRectMake(0, 100, self.view.bounds.size.width, 460)];
    [self addChildViewController:_zhinengVC];
    
    [self.view addSubview:self.shougongVC.view];
    self.currentVC = self.shougongVC;
}

//  在这里边处理是否绑定了
- (void)didClickButtonAction:(UIButton *)btn{
    if ((self.currentVC == self.shougongVC && btn.tag ==100)||(self.currentVC == _zhinengVC && btn.tag == 101)) {
        return;
    }else{
        switch (btn.tag) {
            case 100:
                [self replaceController:self.currentVC newController:self.shougongVC];
                break;
            case 101:
                [self replaceController:self.currentVC newController:self.zhinengVC];
                break;
            default:
                break;
        }
    }
}

- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController{
    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:0.3 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished){
        if (finished) {
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            self.currentVC = newController;
        }else{
            self.currentVC = oldController;
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
