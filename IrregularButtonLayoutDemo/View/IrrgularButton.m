//
//  IrrgularButton.m
//  IrregularButtonLayoutDemo
//
//  Created by Devin on 2021/1/9.
//

#import "IrrgularButton.h"

@implementation IrrgularButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        
    }
    return self;
}


-(void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    
    self.backgroundColor = selected ? [UIColor redColor] : [UIColor lightGrayColor];
    [self setTitleColor:selected ? [UIColor whiteColor] : [UIColor blackColor] forState: selected ? UIControlStateSelected : UIControlStateNormal];
    [self setupRadiu:self.height*0.5];

}



@end
