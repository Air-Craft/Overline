//
//  UIImage+OVTransforms.m
//  Lab-VC-Transitions
//
//  Created by Hari Karam Singh on 24/05/2014.
//  Copyright (c) 2014 Air Craft. All rights reserved.
//

#import "UIImage+OVTransforms.h"

@implementation UIImage (OVTransforms)

/////////////////////////////////////////////////////////////////////////
#pragma mark - Rotation
/////////////////////////////////////////////////////////////////////////

- (UIImage *)imageRotatedByRadians:(CGFloat)radians
{
    // Get the bounds for the destination images
    CGRect imgRect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGRect rotatedRect = CGRectApplyAffineTransform(imgRect, CGAffineTransformMakeRotation(-radians));
    
    // Create the contedt with the correct scale
    UIGraphicsBeginImageContextWithOptions(rotatedRect.size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // Rotate the context around the centre and draw in he image
    CGContextTranslateCTM(ctx, rotatedRect.size.width/2, rotatedRect.size.height/2);
    CGContextRotateCTM(ctx, -radians);
    [self drawAtPoint:CGPointMake(-imgRect.size.width/2, -imgRect.size.height/2)];
    
    // Get the image to return and cleanup
    UIImage *rtnImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return rtnImg;
}

//---------------------------------------------------------------------

- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees
{
    return [self imageRotatedByRadians:degrees * (M_PI/180.0f)];
}


/////////////////////////////////////////////////////////////////////////
#pragma mark - Reflection
/////////////////////////////////////////////////////////////////////////

- (UIImage *)imageReflectedHorizontally
{
    return [self imageReflectedHorizontally:YES vertically:NO];
            
}

//---------------------------------------------------------------------

- (UIImage *)imageReflectedVertically
{
    return [self imageReflectedHorizontally:NO vertically:YES];
}

//---------------------------------------------------------------------

- (UIImage *)imageReflectedHorizontally:(BOOL)doHoriontal vertically:(BOOL)doVertical
{
    // Create the contedt with the correct scale
    CGSize size = self.size;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // Rotate the context around the centre and draw in he image
    CGContextScaleCTM(ctx,
                      doHoriontal ? -1.0 : +1.0,
                      doVertical ? -1.0 : +1.0);
    [self drawAtPoint:CGPointMake(doHoriontal ? -size.width : 0,
                                  doVertical ? -size.height: 0)];
    
    // Get the image to return and cleanup
    UIImage *rtnImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return rtnImg;
}

/////////////////////////////////////////////////////////////////////////
#pragma mark - Resizing
/////////////////////////////////////////////////////////////////////////

- (UIImage *)imageScaledBy:(CGFloat)scaleFactor
{
    return [self imageResizedToSize:CGSizeMake(self.size.width * scaleFactor,
                                               self.size.height * scaleFactor)];
}

//---------------------------------------------------------------------

- (UIImage *)imageResizedToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//---------------------------------------------------------------------

- (UIImage *)imageResizedToFit:(CGSize)fitSize
{
    CGSize s = self.size;
    CGSize target = fitSize;
    CGFloat sAR = s.width / s.height;
    CGFloat targetAR = target.width / target.height;
    CGSize outSize;
    if (sAR > targetAR)
        outSize = CGSizeScaledBy(s, target.width / s.width);
    else
        outSize = CGSizeScaledBy(s, target.height / s.height);
    
    return [self imageResizedToSize:outSize];
}

//---------------------------------------------------------------------

- (UIImage *)imageResizedToFill:(CGSize)fillSize
{
    CGSize s = self.size;
    CGSize target = fillSize;
    CGFloat sAR = s.width / s.height;
    CGFloat targetAR = target.width / target.height;
    CGSize outSize;
    if (sAR > targetAR)
        outSize = CGSizeScaledBy(s, target.height / s.height);
    else
        outSize = CGSizeScaledBy(s, target.width / s.width);
    
    return [self imageResizedToSize:outSize];
}



/////////////////////////////////////////////////////////////////////////
#pragma mark - Cropping
/////////////////////////////////////////////////////////////////////////

- (UIImage *)imageCroppedWithRect:(CGRect)rect
{
    UIGraphicsBeginImageContext(rect.size);
    
    // translated rectangle for drawing sub image
    CGRect drawRect = CGRectMake(-rect.origin.x, -rect.origin.y, self.size.width, self.size.height);
    
    // draw image
    [self drawInRect:drawRect];
    
    // grab image
    UIImage *cropped = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return cropped;
}

//---------------------------------------------------------------------

- (UIImage *)circularImageWithDiameter:(CGFloat)diameter
{
    CGSize size = CGSizeMake(diameter, diameter);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    // Get the cutout rect
    CGFloat currDiameter = MIN(self.size.width, self.size.height);
    
    // Draw the cutout mask
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat radius = diameter * 0.5;
    CGContextBeginPath(ctx);
    CGContextAddArc(ctx, radius, radius, radius, 0, 2*M_PI, 0);
    CGContextClosePath(ctx);
    CGContextClip(ctx);
    
    // Scale to new diameter
    CGFloat scale = diameter / currDiameter;
    CGContextScaleCTM(ctx, scale, scale);
    
    // Get the draw rect centered on the image
    CGRect drawRect = { {0, 0}, self.size };
    if (currDiameter == self.size.width)
        drawRect.origin.y = -0.5 * (self.size.height - currDiameter);
    else
        drawRect.origin.x = -0.5 * (self.size.width - currDiameter);
    
    // Draw and extract
    [self drawInRect:drawRect];
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}


@end
