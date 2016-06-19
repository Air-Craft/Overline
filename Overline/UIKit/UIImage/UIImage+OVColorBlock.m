//
//  UIImage+OVSolidColors.m
//  AC-Sabre
//
//  Created by Hari Karam Singh on 28/03/2015.
//
//

#import "UIImage+OVColorBlock.h"

@implementation UIImage (OVColorBlock)

+ (UIImage *)colorBlockImageWithColor:(UIColor *)color size:(CGSize)size
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, size.width, size.height)];
    [color setFill];
    [path fill];
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
