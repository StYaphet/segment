//
//  ViewController.h
//  segmentControl
//
//  Created by admin on 16/4/19.
//  Copyright © 2016年 chunyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) UIScrollView *headerScrollView;
@property (nonatomic, copy) NSArray *headArray;
@property (nonatomic, strong) UIViewController *currentVC;
@property (nonatomic, strong) UIViewController *shougongVC;
@property (nonatomic, strong) UIViewController *zhinengVC;


@end

