//
//  LGGAlphabetInputValidator.m
//  Summary
//
//  Created by 路岗 on 2019/3/20.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGAlphabetInputValidator.h"

@implementation LGGAlphabetInputValidator

-(BOOL)validateTextFeild:(UITextField *)textFeild error:(NSError * _Nullable __autoreleasing *)error{
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[a-zA-Z]*$" options:NSRegularExpressionAnchorsMatchLines error:nil];
    NSUInteger number = [regex numberOfMatchesInString:textFeild.text options:NSMatchingAnchored range:NSMakeRange(0, textFeild.text.length)];
    if (number == 0) {
        if (error != nil) {
            NSString *descript = NSLocalizedString(@"The validation failed", @"");
            NSString *failure = NSLocalizedString(@"The input can only contain alphabet values", @"");
            NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:@[descript,failure] forKeys:@[NSLocalizedDescriptionKey,NSLocalizedFailureReasonErrorKey]];
            *error = [NSError errorWithDomain:InputValidatorErrorDomain code:1002 userInfo:userInfo];
            
        }
        return NO;
    }
    
    return YES;
}
@end
