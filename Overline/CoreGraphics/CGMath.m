//
//  CGMath.m
//  Overline
//
//

#import "CGMath.h"

/////////////////////////////////////////////////////////////////////////
#pragma mark - CGPoint
/////////////////////////////////////////////////////////////////////////

CGPoint CGPointAdd(CGPoint A, CGPoint B)
{
    return CGPointMake(A.x + B.x, A.y + B.y);
}

CGPoint CGPointSubtract(CGPoint A, CGPoint B)
{
    return CGPointMake(A.x - B.x, A.y - B.y);
}

CGFloat CGPointDistance(CGPoint A, CGPoint B)
{
    return sqrt((A.x - B.x) * (A.x - B.x) + (A.y - B.y) * (A.y - B.y));
}

CGPoint CGPointLinearInterp(CGPoint A, CGPoint B, CGFloat fraction)
{
    CGPoint C = CGPointMake((B.x - A.x) * fraction + A.x,
                            (B.y - A.y) * fraction + A.y);
    return C;
}

/////////////////////////////////////////////////////////////////////////
#pragma mark - CGSize
/////////////////////////////////////////////////////////////////////////

CGSize CGSizeScaledBy(CGSize s, CGFloat scale)
{
    return CGSizeMake(s.width*scale, s.height*scale);
}

//---------------------------------------------------------------------

CGSize CGSizeScaledToFill(CGSize s, CGSize target)
{
    CGFloat sAR = s.width / s.height;
    CGFloat targetAR = target.width / target.height;
    if (sAR > targetAR)
        return CGSizeScaledBy(s, target.height / s.height);
    else
        return CGSizeScaledBy(s, target.width / s.width);
}

//---------------------------------------------------------------------

CGSize CGSizeScaledToFit(CGSize s, CGSize target)
{
    CGFloat sAR = s.width / s.height;
    CGFloat targetAR = target.width / target.height;
    if (sAR > targetAR)
        return CGSizeScaledBy(s, target.width / s.width);
    else
        return CGSizeScaledBy(s, target.height / s.height);
}

/////////////////////////////////////////////////////////////////////////
#pragma mark - CGRect
/////////////////////////////////////////////////////////////////////////

CGRect CGRectCenteredOnRect(CGRect r, CGRect target)
{
    CGFloat x = target.origin.x +
                0.5 * (target.size.width - r.size.width);
    CGFloat y = target.origin.y +
                0.5 * (target.size.height - r.size.height);
    CGRect centered = r;
    centered.origin = CGPointMake(x, y);
    return centered;
}