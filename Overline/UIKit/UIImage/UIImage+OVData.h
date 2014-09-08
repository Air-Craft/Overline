//
//  UIImage+OVData.h
//  Overline
//
//  Created by Hari Karam Singh on 08/09/2014.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (OVData)

/**
 Return an NSData object with the raw RGBA pixel byte data.  Assumes 4 bytes per pixel
 */
- (NSData *)rawImageData;


/**
 Get the UIColor for the pixel at x,y.
 @param xCoord  0 <= x < width  (throws exception if not)
 @param yCoord  0 <= y < height (throws exception if not)
 */
- (UIColor *)pixelColorAtX:(NSUInteger)xCoord andY:(NSUInteger)yCoord;

@end
