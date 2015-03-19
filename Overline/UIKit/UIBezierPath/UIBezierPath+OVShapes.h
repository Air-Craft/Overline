//
//  UIBezierPath+OVShapes.h
//  AC-Sabre
//
//  Created by Hari Karam Singh on 05/06/2014.
//
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (OVShapes)

+ (instancetype)bezierPathLineFromPoint:(CGPoint)fromPoint toPoint:(CGPoint)toPoint;

+ (instancetype)bezierPathEquilaterialTriangleWithSideLength:(CGFloat)sideLength rotation:(CGFloat)rotation;

@end

