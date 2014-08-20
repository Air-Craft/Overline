//
// Created by yaakaito on 2013/01/02.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NSString+OVJSON.h"


@implementation NSString (OVJSON)

+ (instancetype)stringFromJSONObject:(id)jsonObject
{
    NSError *err;
    NSData *data = [NSJSONSerialization dataWithJSONObject:jsonObject options:kNilOptions error:&err];
    if (err)
    {
        NSLog(@"Error converting object to JSON: %@", err);
        return nil;
    }
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}


- (id)JSON {
    return [self jsonObject];
}

- (id)jsonObject {
    NSError *error = nil;
    id JSON = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding]
                                    options:NSJSONReadingAllowFragments
                                      error:&error];
    if (error) {
        return nil;
    }

    return JSON;
}
@end