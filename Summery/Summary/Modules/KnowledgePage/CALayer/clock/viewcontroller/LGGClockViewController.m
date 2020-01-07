//
//  LGGClockViewController.m
//  Summary
//
//  Created by 路岗 on 19/12/2019.
//  Copyright © 2019 Gang. All rights reserved.
//

#import "LGGClockViewController.h"

@interface LGGClockViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *clockBackground;
@property (weak, nonatomic) IBOutlet UIImageView *hourImage;
@property (weak, nonatomic) IBOutlet UIImageView *minImage;
@property (weak, nonatomic) IBOutlet UIImageView *secImage;
@property(nonatomic, strong) NSTimer *clockTimer;
@property(nonatomic, strong) CAReplicatorLayer *replicatorrLayer;
@property(nonatomic, strong) UIView *contentView;

@end

@implementation LGGClockViewController
+(void)load{
    LGGKnowledgeClassifyModel *model = [[LGGKnowledgeClassifyModel alloc]initWithSuperClassify:@"CAlayer" withTitle:@"CAlayerCLock" withClassName:@"LGGClockViewController"];
    [[LGGKnowledgeModelManager shareManager]addModel:model];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //来个定时器让他们转
    
    self.hourImage.layer.anchorPoint = CGPointMake(0.5, 0.9);
    self.minImage.layer.anchorPoint = CGPointMake(0.5, 0.9);
    self.secImage.layer.anchorPoint = CGPointMake(0.5, 0.9);
    [self click];
    self.clockTimer =  [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(click) userInfo:nil repeats:YES];
    
    
    UIView *blueColor = [[UIView alloc]init];
    blueColor.backgroundColor = [UIColor blueColor];
    blueColor.frame = CGRectMake(100, 100, 100, 100);
    blueColor.layer.anchorPoint = CGPointMake(0, 0);

    [self.view addSubview:blueColor];

    DLog(@"%@",NSStringFromCGPoint(blueColor.layer.anchorPoint));
     UIView *redView = [[UIView alloc]init];
        redView.backgroundColor = [UIColor redColor];
        redView.frame = CGRectMake(100, 100, 100, 100);
        [self.view addSubview:redView];
//    redView.layer.anchorPoint = CGPointMake(0, 0);
//    redView.layer.geometryFlipped = YES;
    
        
    [UIView animateWithDuration:2 animations:^{
        redView.transform = CGAffineTransformMakeRotation(M_PI_4);
        
    }];
        NSLog(@"frame %@ bounds %@",NSStringFromCGRect(redView.frame),NSStringFromCGRect(redView.bounds));
    
//    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
//        replicatorLayer.frame = CGRectMake(200, 200, 200, 200);
//        replicatorLayer.position = self.view.center;
//        [self.view.layer addSublayer:replicatorLayer];
//
//        replicatorLayer.backgroundColor = [UIColor brownColor].CGColor;
//
//        replicatorLayer.instanceCount = 3;
//        replicatorLayer.instanceTransform = CATransform3DMakeTranslation(10, 10, 0);
//
//        replicatorLayer.instanceRedOffset = -0.8;
//        replicatorLayer.instanceBlueOffset = -0.1;
//
//        CALayer *layer = [CALayer layer];
//        layer.frame = CGRectMake(0, 0, 100, 100);
//        layer.backgroundColor = [UIColor whiteColor].CGColor;
//        [replicatorLayer addSublayer:layer];

//    self.contentView = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 200, 200)];
//    [self.view addSubview:self.contentView];
//    [self musicVolumnAnimation];
}
//音乐播放柱状动画
- (void)musicVolumnAnimation{
    //创建复制层，因为我们做的多个音量柱变化的动画都是一样的，所以创建了一个复制层，这个复制层可以对里面的 sublayer 进行复制，所以我们不需要重复创建了
    
    CAReplicatorLayer *replicatorrLayer = [CAReplicatorLayer layer];
    replicatorrLayer.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height);
    replicatorrLayer.backgroundColor = [UIColor blackColor].CGColor;
    self.replicatorrLayer = replicatorrLayer;
    [self.contentView.layer addSublayer:replicatorrLayer];
    
    
    //创建音量震动条
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor greenColor].CGColor;
    CGFloat width = 30;
    CGFloat height = 100;
    layer.bounds = CGRectMake(0, self.contentView.frame.size.height - height, width, height);
    layer.anchorPoint = CGPointMake(0, 1);
    layer.position = CGPointMake(0, self.contentView.frame.size.height);
//    [self.contentView.layer addSublayer:layer];
    
    //创建音量震动动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    animation.toValue = @0;
    animation.duration = 1;
    animation.repeatCount = MAXFLOAT;
    animation.autoreverses = YES;
    [layer addAnimation:animation forKey:nil];
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    
    blueLayer.bounds = CGRectMake(0, self.contentView.frame.size.height - height, width, 200);
    blueLayer.anchorPoint = CGPointMake(0, 1);
    blueLayer.position = CGPointMake(0, self.contentView.frame.size.height);
    [replicatorrLayer addSublayer:blueLayer];
    
    [replicatorrLayer addSublayer:layer];
    
    
    
    //* The number of copies to create, including the source object.
    replicatorrLayer.instanceCount = 6; //复制 sublayer 的个数，包括创建的第一个sublayer 在内的个数
    replicatorrLayer.instanceDelay = 0.4; //设置动画延迟执行的时间
    replicatorrLayer.instanceAlphaOffset = -0.15;   //设置透明度递减
    replicatorrLayer.instanceTransform = CATransform3DMakeTranslation(50, 0, 0);
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.replicatorrLayer.frame = self.contentView.bounds;
}



-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.clockTimer) {
        [self.clockTimer invalidate];
    }
}
- (void)click{
    //获取当前时间
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSCalendarUnit flag = NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:flag fromDate:[NSDate date]];
    DLog(@"%@",components);

                                    CGFloat hourAngle = (components.hour%12)/12.0 *M_PI*2;
                                    CGFloat minAngle = components.minute/60.0*M_PI*2;
                                    CGFloat secAngle = components.second/60.0 *M_PI*2;
                                    self.hourImage.transform = CGAffineTransformMakeRotation(hourAngle);
                                    self.minImage.transform = CGAffineTransformMakeRotation(minAngle);
                                    self.secImage.transform = CGAffineTransformMakeRotation(secAngle);
                                    
}

-(void)dealloc{
    
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
