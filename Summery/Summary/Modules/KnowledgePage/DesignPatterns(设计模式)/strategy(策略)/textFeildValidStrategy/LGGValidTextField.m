//
//  LGGValidTextField.m
//  Summary
//
//  Created by 路岗 on 2019/3/20.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGValidTextField.h"

@implementation LGGValidTextField

-(BOOL)validate{
    NSError *error = nil;
    BOOL validate = [_inputValidator validateTextFeild:self error:&error];
    if(validate ==NO){
        
        NSString *descript = [[error userInfo]objectForKey:NSLocalizedDescriptionKey];
        NSString *failue = [[error userInfo]objectForKey:NSLocalizedFailureReasonErrorKey];
        [[[UIAlertView alloc]initWithTitle:descript message:failue delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil]show];

    }
    return validate;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
