//
//  OVCompatibility.m
//  AC-Sabre
//
//  Created by Hari Karam Singh on 13/09/2015.
//
//

#import "OVCompatibility.h"

@implementation OVCompatibility

+ (BOOL)isIPhone
{
    return ([[[UIDevice currentDevice] model] isEqualToString: @"iPhone"]);
}

//---------------------------------------------------------------------

+ (BOOL)isIPad
{
    return ([[[UIDevice currentDevice] model] isEqualToString: @"iPad"]);
}

//---------------------------------------------------------------------

+ (BOOL)isIPodTouch
{
    return ([[[UIDevice currentDevice] model] isEqualToString: @"iPod Touch"]);
}


@end
