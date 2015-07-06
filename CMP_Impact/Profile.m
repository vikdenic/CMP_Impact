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
@dynamic imageFile;

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

+(void)setProfileSingletonwithBlock:(void(^)(Profile *profile, NSError *error))completionHandler
{
    if ([User currentUser])
    {
        PFQuery *query = [PFQuery queryWithClassName:@"Profile"];
        [query includeKey:@"user"];
        [query whereKey:@"user" equalTo:[User currentUser]];

        [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
            [UniversalProfile sharedInstance].profile = (Profile *) object;
            completionHandler((Profile *) object, error);
        }];
    }
}

@end
