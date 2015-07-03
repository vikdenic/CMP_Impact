//
//  User.h
//  CMP_Impact
//
//  Created by Vik Denic on 7/2/15.
//  Copyright (c) 2015 Vik Denic. All rights reserved.
//

#import <Parse/Parse.h>

@interface User : PFUser <PFSubclassing>

+(void)load;

+(User *)currentUser;

-(instancetype)initWithUsername:(NSString *)username withPassword: (NSString *)password;
+(void)createUserWithUserName:(NSString *)username withPassword:(NSString *)password completion:(void (^)(BOOL, NSError *))completionHandler;

@end
