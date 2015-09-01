//
//  CheckMarkView.m
//  MangoCityTravel
//
//  Created by lijun on 14-12-12.
//  Copyright (c) 2014年 mangocity. All rights reserved.
//

#import "CheckMarkView.h"

#define DEFAULTCOLOR  [UIColor colorWithRed:1 green:102.f/255.f blue:0 alpha:1].CGColor
#define DEFAULTDELAY  (0.2)
#define DEFAULTLINEWIDTH (1.3)

@implementation CheckMarkView

#pragma mark - Create CheckMark View
// Default Color and Rect(35 * 35)
+ (CheckMarkView *)initCheckMark
{
    return [[self class] initCheckMarkWithFrame:CGRectZero andStrokeColor:nil];
}

// Default Color RGB(255 102 0)
+ (CheckMarkView *)initCheckMarkWithFrame:(CGRect)rect
{
    return [[self class] initCheckMarkWithFrame:rect andStrokeColor:nil];
}

// Assign Rect & Color
+ (CheckMarkView *)initCheckMarkWithFrame:(CGRect)rect andStrokeColor:(UIColor *)color
{
    return [[self class] initCheckMarkWithFrame:rect andStrokeColor:color andDelay:DEFAULTDELAY];
}

// Assign Rect & delay
+ (CheckMarkView *)initCheckMarkWithFrame:(CGRect)rect andDelay:(NSTimeInterval)delay
{
    return [[self class] initCheckMarkWithFrame:rect andStrokeColor:nil andDelay:delay];
}

// Assign Rect & Color & delay
+ (CheckMarkView *)initCheckMarkWithFrame:(CGRect)rect andStrokeColor:(UIColor *)color andDelay:(NSTimeInterval)delay
{
    return [[self class] initCheckMarkWithFrame:rect andStrokeColor:color andDelay:delay andLineWidth:DEFAULTLINEWIDTH];
}

// Assign Rect & Color & delay & lineWidth
+ (CheckMarkView *)initCheckMarkWithFrame:(CGRect)rect andStrokeColor:(UIColor *)color andDelay:(NSTimeInterval)delay andLineWidth:(CGFloat)lineWidth
{
    return [[[self class] alloc] initCheckMarkWithFrame:rect andStrokeColor:color andDelay:delay andLineWidth:lineWidth];
}

- (CheckMarkView *)initCheckMarkWithFrame:(CGRect)rect andStrokeColor:(UIColor *)color andDelay:(NSTimeInterval)delay andLineWidth:(CGFloat)lineWidth
{
    self = [super initWithFrame:[self rect:rect]];
    if (self) {
        [self performSelector:@selector(drawAnimation:) withObject:[self checkLayer:color andLineWidth:[self lineWidth:lineWidth]] afterDelay:[self delay:delay]];
    }

    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    return [[self class] initCheckMark];
}


#pragma mark -
#pragma makr ---

- (NSTimeInterval)delay:(NSTimeInterval)delay
{
    return (delay < DEFAULTDELAY) ? DEFAULTDELAY : delay;
}

- (CGRect)rect:(CGRect)rect
{
    return (rect.size.width <= 0 || rect.size.height <= 0) ? CGRectMake(0, 0, 35.f, 35.f) : rect;
}

- (CGColorRef)color:(UIColor *)color
{
    return color ? color.CGColor : DEFAULTCOLOR;
}

- (CGFloat)lineWidth:(CGFloat)lineWidth
{
    return (lineWidth >= DEFAULTLINEWIDTH) ? lineWidth : DEFAULTLINEWIDTH;
}

- (CGPathRef)bezierPath
{
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(self.bounds) + 0.27083 * CGRectGetWidth(self.bounds), CGRectGetMinY(self.bounds) + 0.54167 * CGRectGetHeight(self.bounds))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(self.bounds) + 0.41667 * CGRectGetWidth(self.bounds), CGRectGetMinY(self.bounds) + 0.68750 * CGRectGetHeight(self.bounds))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(self.bounds) + 0.75000 * CGRectGetWidth(self.bounds), CGRectGetMinY(self.bounds) + 0.35417 * CGRectGetHeight(self.bounds))];
    bezierPath.lineCapStyle = kCGLineCapSquare;
    
    return bezierPath.CGPath;
}

- (CAShapeLayer *)checkLayer:(UIColor *)color andLineWidth:(CGFloat)lineWidth
{
    CAShapeLayer *checkLayer = [CAShapeLayer layer];
    checkLayer.path = [self bezierPath];
    checkLayer.fillColor = [UIColor clearColor].CGColor;
    checkLayer.strokeColor = [self color:color];
    checkLayer.lineWidth = [self lineWidth:lineWidth];
    checkLayer.frame = self.bounds;
    return checkLayer;
}

-(void)drawAnimation:(CALayer*)layer
{
    [self.layer addSublayer:layer];
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 0.5;
    animation.delegate = self;
    animation.fromValue = [NSNumber numberWithInteger:0];
    animation.toValue = [NSNumber numberWithInteger:1];
    [layer addAnimation:animation forKey:@"key"];
}

@end
