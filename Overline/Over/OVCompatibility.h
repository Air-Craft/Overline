//
//  OVCompatibility.h
//  AC-Sabre
//
//  Created by Hari Karam Singh on 13/09/2015.
//
//

#import <Foundation/Foundation.h>


//#define IS_WIDESCREEN_IOS7 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )
//#define IS_WIDESCREEN_IOS8 ( fabs( ( double )[ [ UIScreen mainScreen ] nativeBounds ].size.height - ( double )1136 ) < DBL_EPSILON )
//#define IS_WIDESCREEN      ( ( [ [ UIScreen mainScreen ] respondsToSelector: @selector( nativeBounds ) ] ) ? IS_WIDESCREEN_IOS8 : IS_WIDESCREEN_IOS7 )



@interface OVCompatibility : NSObject

+ (BOOL)isIPhone;
+ (BOOL)isIPad;
+ (BOOL)isIPodTouch;

@end
