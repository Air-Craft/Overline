//
//  NSObject+Runtime.h
//  AC-Sabre
//
//  Created by Hari Karam Singh on 04/12/2014.
//
//

#import <Foundation/Foundation.h>

@interface NSObject (Runtime)

/** Array of NSString's representaing the names of all class properties (ie @property) */
+ (NSArray *)classPropertyList;

@end
