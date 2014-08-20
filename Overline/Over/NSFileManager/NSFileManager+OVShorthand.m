//
//  NSFileManager+Shorthand.m
//  MixUp
//
//  Created by Hari Karam Singh on 20/08/2014.
//

#import "NSFileManager+OVShorthand.h"

@implementation NSFileManager (OVShorthand)

+ (unsigned long long)sizeOfFileAtPath:(NSString *)path
{
    unsigned long long fileSize = [[[self defaultManager] attributesOfItemAtPath:path error:nil][NSFileSize] unsignedLongLongValue];
    return fileSize;
}

@end
