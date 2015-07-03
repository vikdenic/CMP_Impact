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

-(instancetype)initWithUsername:(NSString *)username withPassword: (NSString *)password
{
    self = [super init];
    self.username = username;
    self.password = password;
    return self;
}

+(void)createUserWithUserName:(NSString *)username withPassword:(NSString *)password completion:(void (^)(BOOL, NSError *))completionHandler
{
    User *user = [[User alloc] initWithUsername:username withPassword:password];

    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        completionHandler(succeeded, error);
    }];
}

@end
