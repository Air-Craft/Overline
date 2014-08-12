//
//  UIImageView+Shorthand.m
//  MixUp
//
//  Created by Hari Karam Singh on 12/08/2014.
//  Copyright (c) 2014 MPC. All rights reserved.
//

#import "UIImageView+Shorthand.h"

@implementation UIImageView (Shorthand)

+ (instancetype)imageViewWithImageNamed:(NSString *)imageName
{
    return [[self alloc] initWithImageNamed:imageName];
}

//---------------------------------------------------------------------

- (instancetype)initWithImageNamed:(NSString *)imageName
{
    UIImage *img = [UIImage imageNamed:imageName];
    return [self initWithImage:img];
}

@end
