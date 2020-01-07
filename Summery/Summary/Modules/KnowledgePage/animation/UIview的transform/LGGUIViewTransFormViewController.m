//
//  LGGUIViewTransFormViewController.m
//  Summary
//
//  Created by 路岗 on 2019/3/31.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGUIViewTransFormViewController.h"

@interface LGGUIViewTransFormViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tranlateView;

@end

@implementation LGGUIViewTransFormViewController

+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"Translate" withTitle:@"UIview translate" withClassName:@"LGGUIViewTransFormViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
}
- (instancetype)init{
    self = [super initWithNibName:@"LGGUIViewTransFormViewController" bundle:[NSBundle mainBundle]];
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
}

                                                 
- (IBAction)translate:(id)sender {
    //一次性改变transfrom，当发生改变后，不再生效
    //    self.tranlateView.transform = CGAffineTransformMakeTranslation(0, 100);
    
    //在新的变形基础之上，继续动画
    self.tranlateView.transform = CGAffineTransformTranslate(self.tranlateView.transform, 0, 100);
}


- (IBAction)scale:(id)sender {
    
    //一次性缩小
    //    self.tranlateView.transform = CGAffineTransformMakeScale(0.5,0.5);
    
    //在上次基础上缩小
    self.tranlateView.transform = CGAffineTransformScale(self.tranlateView.transform, 0.5, 0.5);
}

- (IBAction)rotate:(id)sender {
      self.tranlateView.transform = CGAffineTransformRotate(self.tranlateView.transform, M_PI_2);
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
