//
//  LGGNumberInputValidator.m
//  Summary
//
//  Created by 路岗 on 2019/3/20.
//  Copyright © 2019年 Gang. All rights reserved.
//

#import "LGGNumberInputValidator.h"

@implementation LGGNumberInputValidator

-(BOOL)validateTextFeild:(UITextField *)textFeild error:(NSError **)error{
    
    NSError *regexError = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"^[0-9]*$" options:NSRegularExpressionCaseInsensitive error:&regexError];
   NSUInteger matchNumber = [regex numberOfMatchesInString:textFeild.text options:NSMatchingAnchored range:NSMakeRange(0, textFeild.text.length)];
    
    if (matchNumber ==0) {
        
        if (error != nil) {
            NSString *descript = NSLocalizedString(@"The validation failed", @"");
            NSString *failue = NSLocalizedString(@"The input can only contain numberical values", @"");
            NSArray *keyArray = @[NSLocalizedDescriptionKey,NSLocalizedFailureReasonErrorKey];
            NSDictionary *userInfo = [NSDictionary dictionaryWithObjects:@[descript,failue] forKeys:keyArray];
            *error = [NSError errorWithDomain:InputValidatorErrorDomain code:1001 userInfo:userInfo];
            
        }
        return NO;
    }
    return YES;
}

@end
