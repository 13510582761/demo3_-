//
//  myView.m
//  demo3_饼状图
//
//  Created by jinyong on 16/4/5.
//  Copyright © 2016年 jinyong. All rights reserved.
//

#import "myView.h"

@implementation myView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    float rectW = rect.size.width;
    float rectH = rect.size.height;
    CGPoint CenterPoint = CGPointMake(rectW * 0.5, rectH * 0.5);
    float radius = (rectW > rectH ? rectH : rectW) * 0.5;
    int sum = 0;
    for (int i=0; i<self.sections.count; i++) {
        sum += [self.sections[i] integerValue];
    }
    float startAngle = 0;
    float endAngle = 0;
    
    //计算扇形的始终点
    for (int i=0; i<self.sections.count; i++) {
        //给定一个起始点
        CGContextMoveToPoint(context,CenterPoint.x,CenterPoint.y);
        float scale = [self.sections[i] integerValue] / (sum * 1.0);
        endAngle = startAngle + scale * M_PI * 2;
        CGContextAddArc(context,CenterPoint.x,CenterPoint.y, radius,startAngle,endAngle,0);
        //重新设置新起点
        startAngle = endAngle;
        //设置颜色
        [(UIColor*)self.colorSections[i] set];
        //绘图
        CGContextFillPath(context);
    }
}

@end
