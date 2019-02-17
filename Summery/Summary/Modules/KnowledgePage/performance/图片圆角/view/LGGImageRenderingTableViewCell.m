//
//  LGGImageRenderingTableViewCell.m
//  Summary
//
//  Created by 路岗 on 2019/2/13.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGImageRenderingTableViewCell.h"

@interface LGGImageRenderingTableViewCell()
@property(nonatomic,assign)CGFloat left;
@end
@implementation LGGImageRenderingTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.contentView.backgroundColor = [UIColor blueColor];
        UIEdgeInsets edge = UIEdgeInsetsMake(10, 10, 10, 10);
        CGFloat radius = 60;
        self.left= 0;
        //多张图片并排
        for (int i = 0; i<0; i++) {
            UIImageView *imageview = [UIImageView new];
            imageview.image = [UIImage imageNamed:@"rendering"];
            [self.contentView addSubview:imageview];
            [imageview mas_makeConstraints:^(MASConstraintMaker *make) {
                self.left += edge.left;
                make.left.mas_offset(self.left);
                make.top.mas_offset(edge.top);
                make.width.height.mas_equalTo(2*radius);
                self.left += 2*radius;
            }];
//            imageview.layer.cornerRadius = radius;
//            imageview.layer.masksToBounds = YES;

        }
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
