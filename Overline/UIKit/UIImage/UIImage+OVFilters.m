//
//  UIImage+OVFilters.m
//  MixUp
//
//  Created by Hari Karam Singh on 01/09/2014.
//  Copyright (c) 2014 MPC. All rights reserved.
//

#import "UIImage+OVFilters.h"

@implementation UIImage (OVFilters)

- (UIImage *)imageProcessedWithFilterNamed:(NSString *)filterName parameters:(NSDictionary *)filterParameters
{
    CIImage *inputImage = [[CIImage alloc] initWithImage:self];
    
    // CIFilter CIHueAdjust
    CIFilter *filter = [CIFilter filterWithName:filterName];
    [filter setDefaults];

    // Set the input image
    [filter setValue:inputImage forKey:@"inputImage"];

    [filterParameters enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        
        [filter setValue:obj forKeyPath:key];
        
    }];
    
    // CIImage with effect
    CIImage *outputImage = [filter valueForKey:@"outputImage"];
    
    // define context
    CIContext *context = [CIContext contextWithOptions:nil];
    
    // set image to UIImageView
    UIImage *outImg = [UIImage imageWithCGImage:
                         [context createCGImage:outputImage
                                       fromRect:outputImage.extent]];
    return outImg;
}

//---------------------------------------------------------------------

- (UIImage *)monochromeImageWithColor:(UIColor *)color intensity:(CGFloat)intensity
{
    CIColor *col = [CIColor colorWithCGColor:color.CGColor];
    
    NSDictionary *params = @{
                             @"inputColor": col,
                             @"inputIntensity": @(intensity)
                             };
    return [self imageProcessedWithFilterNamed:@"CIColorMonochrome" parameters:params];
}
@end
