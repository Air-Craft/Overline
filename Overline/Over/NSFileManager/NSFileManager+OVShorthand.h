//
//  NSFileManager+Shorthand.h
//  MixUp
//
//  Created by Hari Karam Singh on 20/08/2014.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (OVShorthand)

+ (unsigned long long)sizeOfFileAtPath:(NSString *)path;

@end
