//
//  ViewController.m
//  IrregularButtonLayoutDemo
//
//  Created by Devin on 2021/1/9.
//

#import "ViewController.h"
#import "IrrgularButton.h"
#import "IrrgularButtonView.h"

@interface ViewController ()
/** 不规则按钮视图 */
@property (nonatomic, weak) IrrgularButtonView *btnsView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *btnsArr = @[@"读书",@"读书读什么书",@"看电影",@"看电影看什么电影",@"爬山",@"爬山爬什么山",@"旅游",@"旅游旅什么游"];

    IrrgularButtonView *btnsView = [[IrrgularButtonView alloc] initWithFrame:CGRectMake(0, 150, self.view.width, 0)];
    btnsView.backgroundColor = [UIColor yellowColor];
//    btnsView.selMaxCount = 1;
//    btnsView.selMaxCount = btnsArr.count;
//
    btnsView.height = [btnsView setupBtnClass:[IrrgularButton class] btnStrArr:btnsArr lrInterVal:15 udInterVal:15 btnH:25];
    self.btnsView = btnsView;
    
    UIButton *confirmBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, btnsView.bottom + 60, self.view.width, 60)];
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [confirmBtn setTitleColor: [UIColor whiteColor] forState:UIControlStateNormal];
    confirmBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [confirmBtn addTarget:self action:@selector(confirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
    confirmBtn.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:btnsView];
    [self.view addSubview:confirmBtn];
   
    
}


-(void)confirmBtnClick{
    NSLog(@"%@", _btnsView.btnSelStrArr);
    NSLog(@"%@", _btnsView.selAllBtnStr);
    
}


@end
