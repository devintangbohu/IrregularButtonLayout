//
//  IrrgularButtonView.h
//  IrregularButtonLayoutDemo
//
//  Created by Devin on 2021/1/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface IrrgularButtonView : UIView

//默认为选中3个,修改可以更改选中个数
@property (nonatomic, assign) CGFloat selMaxCount;
/** 按钮选中的字符 */
@property (nonatomic, copy , readonly) NSString *selAllBtnStr;
/** 按钮选中的字符数组 */
@property (nonatomic, strong , readonly) NSArray *btnSelStrArr;

/** 设置不规则按钮数据，并且返回高度
 * btnClass :     按钮类型
 * btnStrArr ：  按钮数据
 * lrInterVal ：  按钮左右间隔
 * udInterVal ：按钮上下间隔
 * btnH：          按钮高度
 */

-(CGFloat)setupBtnClass:(Class)btnClass btnStrArr:(NSArray<NSString*>*)btnStrArr lrInterVal:(CGFloat) lrInterVal udInterVal:(CGFloat) udInterVal btnH:(CGFloat) btnH;



@end

NS_ASSUME_NONNULL_END
