//
//  UIImage+OVData.m
//  Overline
//
//  Created by Hari Karam Singh on 08/09/2014.
//
//

#import "UIImage+OVData.h"

static const NSUInteger BYTES_PER_PIXEL = 4;


@implementation UIImage (OVData)

- (NSData *)rawImageData
{
    CGImageRef imageRef = [self CGImage];
    NSUInteger width = CGImageGetWidth(imageRef);
    NSUInteger height = CGImageGetHeight(imageRef);
    CGColorSpaceRef colorSpace = CGImageGetColorSpace(imageRef);//CGColorSpaceCreateDeviceRGB();
    NSUInteger dataSize = height * width * BYTES_PER_PIXEL;
    unsigned char *rawData = calloc(width*height, sizeof(GLubyte)*BYTES_PER_PIXEL);
    NSUInteger bytesPerRow = width * BYTES_PER_PIXEL;
    NSUInteger bitsPerComponent = 8;
    CGContextRef context = CGBitmapContextCreate(rawData, width, height,
                                                 bitsPerComponent, bytesPerRow, colorSpace,
                                                 kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    
    CGColorSpaceRelease(colorSpace);
    
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), imageRef);
    CGContextRelease(context);
    
    NSData *rtn = [NSData dataWithBytes:rawData length:dataSize];
    free(rawData);
    return rtn;
}

//---------------------------------------------------------------------

- (UIColor *)pixelColorAtX:(NSUInteger)xCoord andY:(NSUInteger)yCoord
{
    NSAssert(xCoord < self.size.width, @"Out of range!"); // 0
    NSAssert(yCoord < self.size.height, @"Out of range!");
 
    // Get the raw data
    NSData *imgData = [self rawImageData];
    if (!imgData) return nil;
    
    // Calculate the byte offset
    NSUInteger byteIndex = BYTES_PER_PIXEL * (self.size.width * yCoord + xCoord);
    
    // Read in the 4 pixel bytes and scale to 0...1
    unsigned char rgbaData[4];
    NSRange range = { byteIndex, 4u };
    [imgData getBytes:rgbaData range:range];
    CGFloat red   = rgbaData[0] / 255.0;
    CGFloat green = rgbaData[1] / 255.0;
    CGFloat blue  = rgbaData[2] / 255.0;
    CGFloat alpha = rgbaData[3] / 255.0;
    
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}



@end
