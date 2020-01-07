//
//  LGGRumtimeModel.h
//  Summary
//
//  Created by 路岗 on 31/12/2019.
//  Copyright © 2019 Gang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYKit/NSObject+YYModel.h>
NS_ASSUME_NONNULL_BEGIN
@interface LGGRumtimeWorkExperence : NSObject
@property(nonatomic, copy) NSString *company;
@property(nonatomic, copy) NSString *time;
@end

@interface LGGRumtimeEducation : NSObject

@property(nonatomic, copy) NSString *university;
@property(nonatomic, copy) NSString *time;

@end

@interface LGGRumtimeModel : NSObject
@property(nonatomic, assign) uint8_t age;
@property(nonatomic, copy) NSString *name;
@property(nonatomic, strong) LGGRumtimeWorkExperence *workExperence;
@property(nonatomic, strong) LGGRumtimeEducation *LGGRumtimeEducation;


@end

NS_ASSUME_NONNULL_END
