//
// Created by yaakaito on 2012/12/25.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSString+Shorthand.h"


@implementation NSString (Shorthand)

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
@end