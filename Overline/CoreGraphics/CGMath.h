//
//  CGMath.h
//  Overline
//
//

#import <CoreGraphics/CoreGraphics.h>

#ifdef __cplusplus
extern "C" {
#endif

/////////////////////////////////////////////////////////////////////////
#pragma mark - CGPoint
/////////////////////////////////////////////////////////////////////////

/** Returns A + B */
CGPoint CGPointAdd(CGPoint A, CGPoint B);

/** Returns A - B */
CGPoint CGPointSubtract(CGPoint A, CGPoint B);

/** |A-B| ie length of the line connected the two points. */
CGFloat CGPointDistance(CGPoint A, CGPoint B);
    
/** Finds the point that is `fraction` of the way from A to B. Note fraction can be <0 and >1. */
CGPoint CGPointLinearInterp(CGPoint A, CGPoint B, CGFloat fraction);

/////////////////////////////////////////////////////////////////////////
#pragma mark - CGSize
/////////////////////////////////////////////////////////////////////////

    
CGSize CGSizeScaledBy(CGSize s, CGFloat scale);
CGSize CGSizeScaledToFill(CGSize s, CGSize target);
CGSize CGSizeScaledToFit(CGSize s, CGSize target);

/////////////////////////////////////////////////////////////////////////
#pragma mark - CGRect
/////////////////////////////////////////////////////////////////////////

    
/** Returns a CGRect which represents `r` positioning center on target.  Origin is same coord system as target (i.e. like siblings) */
CGRect CGRectCenteredOnRect(CGRect r, CGRect target);

#ifdef __cplusplus
}
#endif