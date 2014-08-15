//
//  CGMath.h
//  Overline
//
//

#import <CoreGraphics/CoreGraphics.h>

#ifdef __cplusplus
extern "C" {
#endif

    
CGSize CGSizeScaledBy(CGSize s, CGFloat scale);
CGSize CGSizeScaledToFill(CGSize s, CGSize target);
CGSize CGSizeScaledToFit(CGSize s, CGSize target);

/** Returns a CGRect which represents `r` positioning center on target.  Origin is same coord system as target (i.e. like siblings) */
CGRect CGRectCenteredOnRect(CGRect r, CGRect target);

#ifdef __cplusplus
}
#endif