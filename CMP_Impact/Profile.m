//
//  Profile.m
//  CMP_Impact
//
//  Created by Vik Denic on 7/2/15.
//  Copyright (c) 2015 Vik Denic. All rights reserved.
//

#import "Profile.h"

@implementation Profile

@dynamic user;
@dynamic fullName;

+(NSString *)parseClassName
{
    return @"Profile";
}

-(instancetype)initWithUser: (User *)user
{
    self = [super init];
    self.user = user;
    self.fullName = @"Your Name";

    return self;
}

@end
