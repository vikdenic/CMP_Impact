//
//  User.m
//  CMP_Impact
//
//  Created by Vik Denic on 7/2/15.
//  Copyright (c) 2015 Vik Denic. All rights reserved.
//

#import "User.h"

@implementation User

+(void)load
{
    [self registerSubclass];
}

+(User *)currentUser
{
    return (User *)[PFUser currentUser];
}

@end
