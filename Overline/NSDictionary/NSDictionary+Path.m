//
// Created by yaakaito on 2013/01/10.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSDictionary+Path.h"
#import "NSArray+SubArray.h"
#import "Overline.h"


@implementation NSDictionary (Path)
- (id)objectForPath:(NSString *)path {
    return [[self class] objectForPathComponents:[path componentsSeparatedByString:@"."] dictionary:self];
}

+ (id)objectForPathComponents:(NSArray *)components dictionary:(NSDictionary *)dictionary {

    if ([components count] == 1) {
        return  [dictionary objectForKey:components[0]];
    }
    else {
        NSDictionary *next = [dictionary objectForKey:components[0]];
        if (next == nil ||  [next isNullObject]) {
            return nil;
        }
        return [[self class] objectForPathComponents:[components subarrayFromIndex:1]
                                          dictionary:next];
    }

}
@end