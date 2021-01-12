//
//  UIView+fitWidthOrHeight.h
//  IrregularButtonLayoutDemo
//
//  Created by Devin on 2021/1/9.
//

#import <UIKit/UIKit.h>

@interface UIView (fitWidthOrHeight)

// @property在分类中只能生成 get set方法的声明 不会实现也不会生成_成员变量
/** frame宽度 */
@property (assign, nonatomic) CGFloat width;

//- (void)setWidth:(CGFloat)width;
//- (CGFloat)width;

/** frame高度 */
@property (assign, nonatomic) CGFloat height;
//- (void)setHeight:(CGFloat)height;
//- (CGFloat)height;

/** 原点坐标x */
@property (assign, nonatomic) CGFloat x;

/** 原点坐标y */
@property (assign, nonatomic) CGFloat y;

/** 坐标最大X */
@property (assign, nonatomic) CGFloat right;
/** 坐标最大Y */
@property (assign, nonatomic) CGFloat bottom;

/** 坐标最小X */
@property (assign, nonatomic) CGFloat left;
/** 坐标最小Y */
@property (assign, nonatomic) CGFloat top;


/** 中心点坐标x */
@property (assign, nonatomic) CGFloat centerX;

/** 中心点坐标y */
@property (assign, nonatomic) CGFloat centerY;

- (CGPoint)topRight;
- (CGPoint)bottomLeft;
- (CGPoint)bottomRight;

/**
 *  圆角处理 (需要给视图设置过Frame之后，才可以设置圆角)
 *
 *  @param radiu 要切掉的大小
 *  @param corner 要选择切掉的角
 */
- (void)setupRadiu:(CGFloat)radiu corner:(UIRectCorner)corner;

/**
*  圆角处理
*
*  @param radiu 要切掉的大小
*/
- (void)setupRadiu:(CGFloat)radiu;


@end
