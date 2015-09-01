//
//  CheckMarkView.h
//  MangoCityTravel
//
//  Created by lijun on 14-12-12.
//  Copyright (c) 2014年 mangocity. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckMarkView : UIView

// Default Color RGB(255 102 0)
+ (CheckMarkView *)initCheckMarkWithFrame:(CGRect)rect;

// Assign Rect & Color
+ (CheckMarkView *)initCheckMarkWithFrame:(CGRect)rect andStrokeColor:(UIColor *)color;

// Assign Rect & delay
+ (CheckMarkView *)initCheckMarkWithFrame:(CGRect)rect andDelay:(NSTimeInterval)delay;

// Assign Rect & Color & delay
+ (CheckMarkView *)initCheckMarkWithFrame:(CGRect)rect andStrokeColor:(UIColor *)color andDelay:(NSTimeInterval)delay;


// Assign Rect & Color & delay & lineWidth
+ (CheckMarkView *)initCheckMarkWithFrame:(CGRect)rect andStrokeColor:(UIColor *)color andDelay:(NSTimeInterval)delay andLineWidth:(CGFloat)lineWidth;


@end
