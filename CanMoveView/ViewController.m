//
//  ViewController.m
//  CanMoveView
//
//  Created by Abj on 2016/11/2.
//  Copyright © 2016年 Abj. All rights reserved.
//

#import "ViewController.h"
#import "CanMoveView.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *containerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.containerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
    _containerView.backgroundColor = [UIColor redColor];
    _containerView.center = self.view.center;
    
    // 1.添加自定义可移动视图
    CanMoveView *moveView = [[CanMoveView alloc]initWithFrame:CGRectMake(75, 75, 50, 50)];
    [_containerView addSubview:moveView];
    [self.view addSubview:_containerView];
    // 2.添加点击事件移动视图
    UIView *eventView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    eventView.backgroundColor = [UIColor greenColor];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveAction:)];
    [eventView addGestureRecognizer:panGesture];
    [_containerView addSubview:eventView];
    // 3.添加可移动的按钮
    UIButton *canMoveBtn = [[UIButton alloc]initWithFrame:CGRectMake(150, 0, 50, 50)];
    canMoveBtn.backgroundColor = [UIColor yellowColor];
    [canMoveBtn addTarget:self action:@selector(btnMoveAction:Event:) forControlEvents:UIControlEventTouchDragInside];
    [_containerView addSubview:canMoveBtn];
}

- (void)moveAction:(UIPanGestureRecognizer *)sender{
    CGPoint locationPoint =     [sender locationInView:sender.view];
    CGPoint currentPoint = [sender.view convertPoint:locationPoint toView:sender.view.superview];
    // 位置判断：是否超出父视图范围
    // 1.x值是否小于0
    if(currentPoint.x < sender.view .frame.size.width / 2){
        currentPoint = CGPointMake(sender.view .frame.size.width / 2, currentPoint.y);
    }
    // 2.x值是否大于最大宽度
    else if(currentPoint.x > sender.view .superview.frame.size.width - sender.view .frame.size.width / 2){
        currentPoint = CGPointMake( sender.view .superview.frame.size.width  - sender.view .frame.size.width / 2, currentPoint.y);
    }
    // 3.y值是否小于0
    if(currentPoint.y < sender.view .frame.size.height / 2 ){
        currentPoint = CGPointMake(currentPoint.x,  sender.view .frame.size.height / 2 );
    }
    // 4.y值是否大于最大高度
    else if(currentPoint.y > sender.view .superview.frame.size.height - sender.view .frame.size.height / 2){
        currentPoint = CGPointMake(currentPoint.x, sender.view .superview.frame.size.height - sender.view .frame.size.height / 2);
    }
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        sender.view.center  = currentPoint;
    } completion:nil];
}

- (void)btnMoveAction:(UIButton *)sender Event:(UIEvent *)event{
    CGPoint locationPoint =   [[[event allTouches]anyObject]locationInView:sender];
    CGPoint currentPoint = [sender convertPoint:locationPoint toView:sender.superview];
    // 位置判断：是否超出父视图范围
    // 1.x值是否小于0
    if(currentPoint.x < sender.frame.size.width / 2){
        currentPoint = CGPointMake(sender .frame.size.width / 2, currentPoint.y);
    }
    // 2.x值是否大于最大宽度
    else if(currentPoint.x > sender.superview.frame.size.width - sender.frame.size.width / 2){
        currentPoint = CGPointMake( sender.superview.frame.size.width  - sender.frame.size.width / 2, currentPoint.y);
    }
    // 3.y值是否小于0
    if(currentPoint.y < sender.frame.size.height / 2 ){
        currentPoint = CGPointMake(currentPoint.x,  sender.frame.size.height / 2 );
    }
    // 4.y值是否大于最大高度
    else if(currentPoint.y > sender.superview.frame.size.height - sender.frame.size.height / 2){
        currentPoint = CGPointMake(currentPoint.x, sender.superview.frame.size.height - sender.frame.size.height / 2);
    }
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        sender.center  = currentPoint;
    } completion:nil];
}

@end
