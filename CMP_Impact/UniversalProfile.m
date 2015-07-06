//
//  UniversalProfile.m
//  CMP_Impact
//
//  Created by Vik Denic on 7/6/15.
//  Copyright (c) 2015 Vik Denic. All rights reserved.
//

#import "UniversalProfile.h"

@implementation UniversalProfile

@synthesize profile;

+ (UniversalProfile *)sharedInstance
{
    static dispatch_once_t predicate = 0;
    __strong static id sharedObject = nil;
    //static id sharedObject = nil;  //if you're not using ARC
    dispatch_once(&predicate, ^{
        sharedObject = [[self alloc] init];
        //sharedObject = [[[self alloc] init] retain]; // if you're not using ARC
    });
    return sharedObject;
}

@end