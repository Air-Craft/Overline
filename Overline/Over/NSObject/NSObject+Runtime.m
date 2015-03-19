//
//  NSObject+Runtime.m
//  AC-Sabre
//
//  Created by Hari Karam Singh on 04/12/2014.
//
//

#import <objc/runtime.h>
#import "NSObject+Runtime.h"

@implementation NSObject (Runtime)

+ (NSArray *)classPropertyList
{
    // Get array of all property names
    unsigned int count;
    objc_property_t *props = class_copyPropertyList(self, &count);
    NSMutableArray *propNames = [NSMutableArray array];
    for (int i=0; i<count; i++)
    {
        NSString *p = [NSString stringWithUTF8String:property_getName(props[i])];
        [propNames addObject:p];
    }
    free(props);
    
    return [NSArray arrayWithArray:propNames];
}

@end
