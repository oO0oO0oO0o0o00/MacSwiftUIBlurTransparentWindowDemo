//
//  *-Bridging-Header.h
//  Playground
//
//  Created by MeowCat on 2025/12/6.
//

#import <Foundation/Foundation.h>
#include <QuartzCore/CABase.h>
#include <QuartzCore/CALayer.h>

#define CA_EXTERN extern

CA_EXTERN NSString * const kCAFilterNormalBlendMode;
CA_EXTERN NSString * const kCAFilterMultiplyBlendMode;
CA_EXTERN NSString * const kCAFilterScreenBlendMode;
CA_EXTERN NSString * const kCAFilterOverlayBlendMode;
CA_EXTERN NSString * const kCAFilterDarkenBlendMode;
CA_EXTERN NSString * const kCAFilterLightenBlendMode;
CA_EXTERN NSString * const kCAFilterColorDodgeBlendMode;
CA_EXTERN NSString * const kCAFilterColorBurnBlendMode;
CA_EXTERN NSString * const kCAFilterSoftLightBlendMode;
CA_EXTERN NSString * const kCAFilterHardLightBlendMode;
CA_EXTERN NSString * const kCAFilterDifferenceBlendMode;
CA_EXTERN NSString * const kCAFilterExclusionBlendMode;
CA_EXTERN NSString * const kCAFilterSubtractBlendMode;
CA_EXTERN NSString * const kCAFilterDivideBlendMode;
CA_EXTERN NSString * const kCAFilterLinearBurnBlendMode;
CA_EXTERN NSString * const kCAFilterLinearDodgeBlendMode;
CA_EXTERN NSString * const kCAFilterLinearLightBlendMode;
CA_EXTERN NSString * const kCAFilterPinLightBlendMode;
CA_EXTERN NSString * const kCAFilterDestOver;
CA_EXTERN NSString * const kCAFilterColorSaturate;
CA_EXTERN NSString * const kCAFilterGaussianBlur;

void CGSGetCatenatedWindowTransform(int cid, int wid, CGAffineTransform* transform);
void CGSFlushSurface(int cid, int wid, int sid, int flag);

@interface CAFilter: NSObject
- (nullable instancetype)initWithType:(nonnull NSString *)type;
- (void)setDefaults;
@end

@interface CALayer ()
@property BOOL allowsGroupBlending;
@end

@interface CABackdropLayer: CALayer
@property BOOL ignoresOffscreenGroups;
@property BOOL windowServerAware;
@property CGFloat bleedAmount;
@property CGFloat statisticsInterval;
@property (copy) NSString *statisticsType;
@property BOOL disablesOccludedBackdropBlurs;
@property BOOL allowsInPlaceFiltering;
@property BOOL captureOnly;
@property CGFloat marginWidth;
@property CGRect backdropRect;
@property CGFloat scale;
@property BOOL usesGlobalGroupNamespace;
@property (copy) NSString *groupName;
@property (getter=isEnabled) BOOL enabled;
@end
