//
//  LGGBitMapViewController.m
//  Summary
//
//  Created by 路岗 on 01/04/2019.
//  Copyright © 2019 Gang. All rights reserved.
//

#import "LGGBitMapViewController.h"

@interface LGGBitMapViewController (){
    char *bitMemo;
}
@property (weak, nonatomic) IBOutlet UITextView *oringinalData;
@property (weak, nonatomic) IBOutlet UITextView *sortedData;

@end

@implementation LGGBitMapViewController


+(void)load{
    
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"Arithmetic" withTitle:@"BitMap" withClassName:@"LGGBitMapViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}

- (instancetype)init{
    self = [super initWithNibName:@"LGGBitMapViewController" bundle:[NSBundle mainBundle]];
    return self;
}


- (IBAction)startBitMap:(id)sender {
    
    
}

//设置第index位为1

/**
 置bit位1
 bit 放置数据，一个位表示一个数，8位则表示8个数。最大支持到32位 为4294967296,所以要开辟这么多的空间来存储。
 @param index 表示第多少个数字
 
 */
- (void)setOneAtIndex:(NSInteger)index{
    
}


- (BOOL)getOneAtIndex:(NSInteger)index{
    
    return NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    bitMemo = new char;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
