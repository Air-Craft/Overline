//
//  UIImageView+Shorthand.h
//  MixUp
//
//  Created by Hari Karam Singh on 12/08/2014.
//  Copyright (c) 2014 MPC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Shorthand)

+ (instancetype)imageViewWithImageNamed:(NSString *)imageName;

- (instancetype)initWithImageNamed:(NSString *)imageName;

@end
