//
//  RGLUIConfiguration.h
//  DocumentReader
//
//  Created by Dmitry Evglevsky on 25.10.23.
//  Copyright © 2023 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentReader/RGLMacros.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, RGLCustomizationColor) {
  RFIDProcessingScreenBackground RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorRFIDProcessingScreenBackground` instead") = 200,
  RFIDProcessingScreenHintLabelText RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorRFIDProcessingScreenHintLabelText` instead") = 201,
  RFIDProcessingScreenHintLabelBackground RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorRFIDProcessingScreenHintLabelBackground` instead") = 202,
  RFIDProcessingScreenProgressLabelText RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorRFIDProcessingScreenProgressLabelText` instead") = 203,
  RFIDProcessingScreenProgressBar RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorRFIDProcessingScreenProgressBar` instead") = 204,
  RFIDProcessingScreenProgressBarBackground RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorRFIDProcessingScreenProgressBarBackground` instead") = 205,
  RFIDProcessingScreenResultLabelText RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorRFIDProcessingScreenResultLabelText` instead") = 206,
  RFIDProcessingScreenLoadingBar RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorRFIDProcessingScreenLoadingBar` instead") = 207,
  MDLProcessingScreenBackground RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorMDLProcessingScreenBackground` instead") = 300,
  MDLProcessingScreenHintLabelText RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorMDLProcessingScreenHintLabelText` instead") = 301,
  MDLProcessingScreenHintLabelBackground RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorMDLProcessingScreenHintLabelBackground` instead") = 302,
  MDLProcessingScreenProgressLabelText RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorMDLProcessingScreenProgressLabelText` instead") = 303,
  MDLProcessingScreenResultLabelText RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorMDLProcessingScreenResultLabelText` instead") = 306,
  MDLProcessingScreenLoadingBar RGL_DEPRECATED(9.3, "Use `RGLCustomizationColorMDLProcessingScreenLoadingBar` instead") = 307,
  RGLCustomizationColorRFIDProcessingScreenBackground = 200,
  RGLCustomizationColorRFIDProcessingScreenHintLabelText = 201,
  RGLCustomizationColorRFIDProcessingScreenHintLabelBackground = 202,
  RGLCustomizationColorRFIDProcessingScreenProgressLabelText = 203,
  RGLCustomizationColorRFIDProcessingScreenProgressBar = 204,
  RGLCustomizationColorRFIDProcessingScreenProgressBarBackground = 205,
  RGLCustomizationColorRFIDProcessingScreenResultLabelText = 206,
  RGLCustomizationColorRFIDProcessingScreenLoadingBar = 207,
  RGLCustomizationColorMDLProcessingScreenBackground = 300,
  RGLCustomizationColorMDLProcessingScreenHintLabelText = 301,
  RGLCustomizationColorMDLProcessingScreenHintLabelBackground = 302,
  RGLCustomizationColorMDLProcessingScreenProgressLabelText = 303,
  RGLCustomizationColorMDLProcessingScreenResultLabelText = 306,
  RGLCustomizationColorMDLProcessingScreenLoadingBar = 307,
  RGLCustomizationColorNextPageIdCardFront = 400,
  RGLCustomizationColorNextPageIdCardBack = 401,
  RGLCustomizationColorNextPagePassportShift = 402,
  RGLCustomizationColorNextPagePassportFlip = 403,
} NS_SWIFT_NAME(DocReader.CustomizationColor);

typedef NS_ENUM(NSInteger, RGLCustomizationFont) {
  RFIDProcessingScreenHintLabel RGL_DEPRECATED(9.3, "Use `RGLCustomizationFontRFIDProcessingScreenHintLabel` instead") = 200,
  RFIDProcessingScreenProgressLabel RGL_DEPRECATED(9.3, "Use `RGLCustomizationFontRFIDProcessingScreenProgressLabel` instead") = 201,
  RFIDProcessingScreenResultLabel RGL_DEPRECATED(9.3, "Use `RGLCustomizationFontRFIDProcessingScreenResultLabel` instead") = 202,
  MDLProcessingScreenHintLabel RGL_DEPRECATED(9.3, "Use `RGLCustomizationFontMDLProcessingScreenHintLabel` instead") = 300,
  MDLProcessingScreenProgressLabel RGL_DEPRECATED(9.3, "Use `RGLCustomizationFontMDLProcessingScreenProgressLabel` instead") = 301,
  MDLProcessingScreenResultLabel RGL_DEPRECATED(9.3, "Use `RGLCustomizationFontMDLProcessingScreenResultLabel` instead") = 302,
  RGLCustomizationFontRFIDProcessingScreenHintLabel = 200,
  RGLCustomizationFontRFIDProcessingScreenProgressLabel = 201,
  RGLCustomizationFontRFIDProcessingScreenResultLabel = 202,
  RGLCustomizationFontMDLProcessingScreenHintLabel = 300,
  RGLCustomizationFontMDLProcessingScreenProgressLabel = 301,
  RGLCustomizationFontMDLProcessingScreenResultLabel = 302,
} NS_SWIFT_NAME(DocReader.CustomizationFont);

typedef NS_ENUM(NSInteger, RGLCustomizationTiming) {
  RGLCustomizationTimingNextPageIdCardStartDelay = 400,
  RGLCustomizationTimingNextPageIdCardEndDelay = 401,
  RGLCustomizationTimingNextPagePassportShiftStartDelay = 402,
  RGLCustomizationTimingNextPagePassportShiftEndDelay = 403,
  RGLCustomizationTimingNextPagePassportFlipStartDelay = 404,
  RGLCustomizationTimingNextPagePassportFlipEndDelay = 405,
} NS_SWIFT_NAME(DocReader.CustomizationTiming);

typedef NS_ENUM(NSInteger, RGLCustomizationContentMode) {
  RGLCustomizationContentModeNextPageIdCardFront = 400,
  RGLCustomizationContentModeNextPageIdCardBack = 401,
} NS_SWIFT_NAME(DocReader.CustomizationContentMode);

NS_SWIFT_NAME(DocReader.CustomizationImage)
typedef NSString* RGLCustomizationImage NS_TYPED_ENUM;

FOUNDATION_EXPORT RGLCustomizationImage const RFIDProcessingScreenFailureImage RGL_DEPRECATED(9.3, "Use `RGLCustomizationImageRFIDProcessingScreenFailure` instead");
FOUNDATION_EXPORT RGLCustomizationImage const MDLProcessingScreenFailureImage RGL_DEPRECATED(9.3, "Use `RGLCustomizationImageMDLProcessingScreenFailure` instead");

FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageRFIDProcessingScreenFailure;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageMDLProcessingScreenFailure;

FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageNextPageIdCardFront;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageNextPageIdCardBack;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageNextPagePassportShift;

FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageNextPagePassportFlipStart;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageNextPagePassportFlipClean;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageNextPagePassportFlipTop;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageNextPagePassportFlipBottom;

FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageHelpAnimation;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageLivenessAnimation;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageBorderBackground;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageTorchButtonOn;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageTorchButtonOff;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageCaptureButton;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageSwitchButton;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageCloseButton;
FOUNDATION_EXPORT RGLCustomizationImage const RGLCustomizationImageMultipageButton;

@class RGLUIConfigurationBuilder;

NS_SWIFT_NAME(DocReader.UIConfiguration)
@interface RGLUIConfiguration : NSObject

RGL_EMPTY_INIT_UNAVAILABLE

- (instancetype)initWithBuilder:(RGLUIConfigurationBuilder *)builder NS_DESIGNATED_INITIALIZER;

+ (instancetype)defaultConfiguration;
+ (instancetype)configurationWithBuilderBlock:(void (^)(RGLUIConfigurationBuilder *))builderBlock;

- (UIColor *)colorForItem:(RGLCustomizationColor)item;
- (UIFont *)fontForItem:(RGLCustomizationFont)item;
- (UIImage *)imageForItem:(RGLCustomizationImage)item;
- (NSNumber *)timingForItem:(RGLCustomizationTiming)item;
- (UIViewContentMode)contentModeForItem:(RGLCustomizationContentMode)item;

@end

NS_SWIFT_NAME(DocReader.UIConfigurationBuilder)
@interface RGLUIConfigurationBuilder : NSObject

RGL_EMPTY_INIT_UNAVAILABLE

- (void)setColor:(UIColor *)color forItem:(RGLCustomizationColor)item;
- (void)setFont:(UIFont *)font forItem:(RGLCustomizationFont)item;
- (void)setImage:(UIImage *)image forItem:(RGLCustomizationImage)item;
- (void)setTiming:(NSNumber *)timing forItem:(RGLCustomizationTiming)item;
- (void)setContentMode:(UIViewContentMode)contentMode forItem:(RGLCustomizationContentMode)item;

@end

NS_ASSUME_NONNULL_END
