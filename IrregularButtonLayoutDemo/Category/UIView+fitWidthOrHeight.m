//
//  UIView+fitWidthOrHeight.m
//  IrregularButtonLayoutDemo
//
//  Created by Devin on 2021/1/9.
//

#import "UIView+fitWidthOrHeight.h"

@implementation UIView (fitWidthOrHeight)

// Query other frame locations
- (CGPoint)bottomRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)bottomLeft
{
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y + self.frame.size.height;
    return CGPointMake(x, y);
}

- (CGPoint)topRight
{
    CGFloat x = self.frame.origin.x + self.frame.size.width;
    CGFloat y = self.frame.origin.y;
    return CGPointMake(x, y);
}


#pragma mark - width
/** 设置当前view的frame.size.width */
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

/** 获取当前view的bounds.size.width */
- (CGFloat)width{
    return  self.bounds.size.width;
}

#pragma mark - height
/** 设置当前view的frame.size.height */
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
/** 获取当前view的bounds.size.height */
- (CGFloat)height{
    return  self.bounds.size.height;
}

#pragma mark - 原点坐标x
/** 设置当前view的frame.origin.x */
- (void)setX:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
/** 获取当前view的frame.origin.x */
-(CGFloat)x{
    return self.frame.origin.x;
}


#pragma mark - 原点坐标y
/** 设置当前view的frame.origin.y */
- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
/** 获取当前view的frame.origin.y */
- (CGFloat)y{
    return self.frame.origin.y;
}

/** 获取最大的x */
- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}

/** 获取最大的y  */
- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}
/**  获取最小的x */
- (CGFloat)left {
    
    return CGRectGetMinX(self.frame);
}
/**  获取最小的y */
- (CGFloat)top {
    
    return CGRectGetMinY(self.frame);
}


#pragma mark - 中心点坐标x
/** 设置当前view的center.x */
- (void)setCenterX:(CGFloat)centerX {
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
/** 获取当前view的center.x */
-(CGFloat)centerX{
    return self.center.x;
}

#pragma mark - 中心点坐标y
/** 设置当前view的center.y */
- (void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}


/** 获取当前view的center.y */
-(CGFloat)centerY{
    return self.center.y;
}

-(void)setupRadiu:(CGFloat)radiu corner:(UIRectCorner)corner{
       //圆角处理
        if (@available(iOS 11.0, *)) {
            self.layer.cornerRadius = radiu;
            self.layer.maskedCorners = (CACornerMask)corner;
            self.layer.masksToBounds = YES;
            
        } else {
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radiu, radiu)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = self.bounds;
            maskLayer.path = maskPath.CGPath;
            self.layer.mask = maskLayer;
        }
}

-(void)setupRadiu:(CGFloat)radiu{
    [self setupRadiu:radiu corner:UIRectCornerAllCorners];
}


@end
