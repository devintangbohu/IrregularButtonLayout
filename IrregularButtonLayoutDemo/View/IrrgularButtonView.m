//
//  IrrgularButtonView.m
//  IrregularButtonLayoutDemo
//
//  Created by Devin on 2021/1/9.
//

#import "IrrgularButtonView.h"

@interface IrrgularButtonView()

/** 所有按钮的高度 */
@property (nonatomic, assign) CGFloat allBtnH;
/** 按钮数据 */
@property (nonatomic, strong) NSArray<NSString *> *btnStrArr;
/** 选中按钮的数组 */
@property (nonatomic, strong) NSMutableArray *selIndexArr;

/** 按钮选中的字符数组 */
@property (nonatomic, strong) NSMutableArray *btnSelectStrArr;

@end

@implementation IrrgularButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.selMaxCount = 3;
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.height = _allBtnH;
}


-(CGFloat)setupBtnClass:(Class)btnClass btnStrArr:(NSArray<NSString*>*)btnStrArr lrInterVal:(CGFloat) lrInterVal udInterVal:(CGFloat) udInterVal btnH:(CGFloat) btnH{
    self.btnStrArr = btnStrArr;
    
    //先移除子控件，再添加
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
   
    for (int i = 0; i<btnStrArr.count; i++) {
        UIFont *font = [UIFont systemFontOfSize:13];
        NSString *btnStr = btnStrArr[i];
        UIButton *btn = [[btnClass alloc] init];
        [btn setTitle:btnStr forState:UIControlStateNormal];
        [btn setTitle:btnStr forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.titleLabel.font = font;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 2000+i;
        
        CGSize size = CGSizeMake(self.width - btnH, 0);
        CGSize strSize = [btnStr boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : font} context:nil].size;
        
        CGFloat btnW = strSize.width + btnH;
        
        if (i != 0) {
            //获取上一个button
            UIButton *previousBtn = [self viewWithTag:(2000 + (i-1))];
            //计算当前button所需要的空间
            CGFloat nowWidth = previousBtn.right + lrInterVal + btnW;
            btnX = nowWidth > self.width ? 0 : (previousBtn.right + lrInterVal);
            btnY = nowWidth > self.width ? (previousBtn.bottom + udInterVal) : (previousBtn.y);
        }
        
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        [btn setupRadiu:btnH*0.5];
        [self addSubview:btn];
        
    }
    
    //获取最后一个按钮
    UIButton *lastBtn = self.subviews.lastObject;
    _allBtnH = lastBtn.bottom;
    [self layoutSubviews];

    return _allBtnH;
    
}


-(void)btnClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    NSInteger index =  btn.tag - 2000;
    
    
    if (btn.selected) {
        //添加选中的索引
        [self.selIndexArr addObject:@(index)];
        
        if (_selIndexArr.count > _selMaxCount ) {//添加选中的个数大于最多个数，将第一个选中的按钮取消选中
            //第1个变成不选中
            NSNumber *firstSelIndex = _selIndexArr[0];
            UIButton *firstSelBtn = [self viewWithTag:([firstSelIndex integerValue] + 2000)];
            //移除第1个选中的索引
            [_selIndexArr removeObjectAtIndex:0];
            firstSelBtn.selected = NO;
        }
        
    }else{
        
        NSMutableArray *tempArr = [NSMutableArray array];
        [tempArr addObjectsFromArray:_selIndexArr];
        
        for (NSNumber *selectIndex in tempArr) {
            NSInteger selIndex = [selectIndex integerValue];
            if (selIndex == index) {
                [_selIndexArr removeObject:selectIndex];
            }
        }
    }
    
    //遍历数组，获取选中字符
    _selAllBtnStr = @"";
    self.btnSelectStrArr = [NSMutableArray array];
    for (NSNumber *selectIndex in _selIndexArr) {
        NSInteger selIndex = [selectIndex integerValue];
        NSString *indexStr = _btnStrArr[selIndex];
        [self.btnSelectStrArr addObject:indexStr];
        _selAllBtnStr = [_selAllBtnStr isEqualToString:@""] ? indexStr : [NSString stringWithFormat:@"%@,%@",_selAllBtnStr,indexStr];
    }

}

#pragma mark ----

/** 懒加载 */
-(NSMutableArray *)selIndexArr{
    if (!_selIndexArr) {
        _selIndexArr = [NSMutableArray array];
    }
    return _selIndexArr;
}

-(NSArray *)btnSelStrArr{
    return _btnSelectStrArr;
}

@end
