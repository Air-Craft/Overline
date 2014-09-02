//
//  UIImage+OVFilters.h
//  MixUp
//
//  Created by Hari Karam Singh on 01/09/2014.
//  Copyright (c) 2014 MPC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (OVFilters)

/** The generic method for basic image filtering.  Params are optional and defaults are used if not specified.  Filter must support key "inputImage" */
- (UIImage *)imageProcessedWithFilterNamed:(NSString *)filterName parameters:(NSDictionary *)filterParameters;

- (UIImage *)monochromeImageWithColor:(UIColor *)color intensity:(CGFloat)intensity;


@end
