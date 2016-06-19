//
//  UIImage+OVSolidColors.h
//  AC-Sabre
//
//  Created by Hari Karam Singh on 28/03/2015.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (OVColorBlock)

/** Create an image with the given size filled with the specified color. Transparency supported. */
+ (UIImage *)colorBlockImageWithColor:(UIColor *)color size:(CGSize)size;

@end
