//
//  LGGValidTextField.h
//  Summary
//
//  Created by 路岗 on 2019/3/20.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LGGInputValidator.h"
NS_ASSUME_NONNULL_BEGIN

@interface LGGValidTextField : UITextField

@property(nonatomic, strong) LGGInputValidator *inputValidator;

-(BOOL)validate;
@end

NS_ASSUME_NONNULL_END
