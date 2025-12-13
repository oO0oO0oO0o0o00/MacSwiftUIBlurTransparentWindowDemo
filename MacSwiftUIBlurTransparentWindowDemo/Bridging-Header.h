//
//  *-Bridging-Header.h
//  Playground
//
//  Created by MeowCat on 2025/12/6.
//

#import <Foundation/Foundation.h>
#include <QuartzCore/CABase.h>
#include <QuartzCore/CALayer.h>

extern NSString * const kCAFilterDarkenBlendMode;
extern NSString * const kCAFilterDestOver;
extern NSString * const kCAFilterLightenBlendMode;
extern NSString * const kCAFilterColorSaturate;
extern NSString * const kCAFilterGaussianBlur;

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
