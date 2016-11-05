//
//  CanMoveView.m
//  CanMoveView
//
//  Created by Abj on 2016/11/2.
//  Copyright © 2016年 Abj. All rights reserved.
//

#import "CanMoveView.h"

@interface CanMoveView ()

@end

@implementation CanMoveView

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setupView];
    }
    return self;
}

- (void)setupView{
    self.backgroundColor = [UIColor blueColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint locationPoint = [[touches anyObject]locationInView:self];
    CGPoint currentPoint = [self convertPoint:locationPoint toView:self.superview];
    // 位置判断：是否超出父视图范围
    // 1.x值是否小于0
    if(currentPoint.x < self.frame.size.width / 2){
        currentPoint = CGPointMake(self.frame.size.width / 2, currentPoint.y);
    }
    // 2.x值是否大于最大宽度
    else if(currentPoint.x > self.superview.frame.size.width - self.frame.size.width / 2){
        currentPoint = CGPointMake( self.superview.frame.size.width  - self.frame.size.width / 2, currentPoint.y);
    }
    // 3.y值是否小于0
    if(currentPoint.y < self.frame.size.height / 2 ){
        currentPoint = CGPointMake(currentPoint.x,  self.frame.size.height / 2 );
    }
    // 4.y值是否大于最大高度
    else if(currentPoint.y > self.superview.frame.size.height - self.frame.size.height / 2){
        currentPoint = CGPointMake(currentPoint.x, self.superview.frame.size.height - self.frame.size.height / 2);
    }
    
    __weak typeof(self)myself = self;
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        myself.center = currentPoint;
    } completion:nil];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
