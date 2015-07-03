//
//  Profile.h
//  CMP_Impact
//
//  Created by Vik Denic on 7/2/15.
//  Copyright (c) 2015 Vik Denic. All rights reserved.
//

#import <Parse/Parse.h>

@interface Profile : PFObject <PFSubclassing>

+(NSString *)parseClassName;

-(instancetype)initWithUser: (User *)user;

@property User *user;
@property NSString *fullName;

@end
