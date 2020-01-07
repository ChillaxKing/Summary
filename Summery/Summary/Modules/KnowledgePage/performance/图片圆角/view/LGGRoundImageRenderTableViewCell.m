//
//  LGGRoundImageRenderTableViewCell.m
//  Summary
//
//  Created by 路岗 on 2019/3/2.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGRoundImageRenderTableViewCell.h"

@implementation LGGRoundImageRenderTableViewCell

+(void)load{
    DLog(@"类中的+load%s",__func__);
}
+(void)initialize{
    DLog(@"类中的+%s",__func__);

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor = [UIColor grayColor];
//    NSObject
//    self.headImageView.clipsToBounds = YES;
    self.headImageView.image = [self ovalImage: [UIImage imageNamed:@"rendering"]];
//    self.headImageView.layer.cornerRadius = 0.5*self.headImageView.bounds.size.height;
//    self.headImageView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
}
/*
 *cut image as corner bound
 */
-(UIImage *)ovalImage:(UIImage *)oriImage{
//    return oriImage;
    UIImage *ovalImage;
    //此处确定画布的大小，用于确定 UIGraphicsGetImageFromCurrentImageContext返回的画布的大小，另外一点注意如
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(426, 426), NO, 0);
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, oriImage.size.height, oriImage.size.height)];
    DLog(@"%f",oriImage.size.height);
    [clipPath addClip];
    [oriImage drawAtPoint:CGPointZero];
    ovalImage = UIGraphicsGetImageFromCurrentImageContext();
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIImagePNGRepresentation(ovalImage)writeToFile:@"/Users/lugang/Desktop/aaa/aa.png" atomically:(YES)];
        
    });
    UIGraphicsEndImageContext();
    return ovalImage;
}
@end
