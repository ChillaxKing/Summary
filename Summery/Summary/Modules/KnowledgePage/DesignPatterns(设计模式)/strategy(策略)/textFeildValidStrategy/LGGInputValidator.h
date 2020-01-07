//
//  LGGInputValidator.h
//  Summary
//
//  Created by 路岗 on 2019/3/20.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <uikit/uikit.h>
NS_ASSUME_NONNULL_BEGIN
//设置错误域
static NSString *const InputValidatorErrorDomain = @"InputValidatorDomain";

@interface LGGInputValidator : NSObject


-(BOOL)validateTextFeild:(UITextField *)textFeild error:(NSError **)error;
@end

NS_ASSUME_NONNULL_END
