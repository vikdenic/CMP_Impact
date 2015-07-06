//
//  UniversalProfile.h
//  CMP_Impact
//
//  Created by Vik Denic on 7/6/15.
//  Copyright (c) 2015 Vik Denic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UniversalProfile : NSObject {
    Profile *profile;
}

@property (nonatomic, retain) Profile *profile;

+ (UniversalProfile *)sharedInstance;

@end
