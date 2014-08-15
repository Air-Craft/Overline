//
//  UIImage+OVTransforms.h
//  Lab-VC-Transitions
//
//  Created by Hari Karam Singh on 24/05/2014.
//  Copyright (c) 2014 Air Craft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OVTransforms)


/////////////////////////////////////////////////////////////////////////
#pragma mark - Rotation
/////////////////////////////////////////////////////////////////////////

/** Returns a new image which is this one rotated by the specified angle.  NOT THREAD SAFE: Call form the main thread only */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

/** Convenience method for degree rotations.  See imageRotatedByRadians: */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;


/////////////////////////////////////////////////////////////////////////
#pragma mark - Reflection
/////////////////////////////////////////////////////////////////////////

/** Mirror image reflected horizontally (around the y-axis) */
- (UIImage *)imageReflectedHorizontally;

/** Mirror image reflected vertically (around the x-axis) */
- (UIImage *)imageReflectedVertically;

/** 
 Programatically selectable reflection for none, one or both axes
 */
- (UIImage *)imageReflectedHorizontally:(BOOL)doHoriontal vertically:(BOOL)doVertical;


/////////////////////////////////////////////////////////////////////////
#pragma mark - Resizing
/////////////////////////////////////////////////////////////////////////

/** Resizes preserving aspect ratio */
- (UIImage *)imageScaledBy:(CGFloat)scaleFactor;

/** Resizes ignoring aspect ratio */
- (UIImage *)imageResizedToSize:(CGSize)newSize;

/** Resizes the image to fit within the given size.  Note the resulting image will have a rect smaller than or equal to fitSize */
- (UIImage *)imageResizedToFit:(CGSize)fitSize;

/** Resizes the image to fill the given size.  Note the resulting image will have a rect larger than or equal to fillSize (in other words, the image is not cropped) */
- (UIImage *)imageResizedToFill:(CGSize)fillSize;


/////////////////////////////////////////////////////////////////////////
#pragma mark - Cropping
/////////////////////////////////////////////////////////////////////////

- (UIImage *)imageCroppedWithRect:(CGRect)cropRect;

/** Returns a new image which is a centered circular crop of the receiving image */
- (UIImage *)circularImageWithDiameter:(CGFloat)diameter;


@end
