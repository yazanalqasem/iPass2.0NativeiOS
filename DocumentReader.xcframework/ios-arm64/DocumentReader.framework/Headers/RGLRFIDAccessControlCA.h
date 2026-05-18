
#import <Foundation/Foundation.h>
#import <DocumentReader/RGLMacros.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(RGLRFIDAccessControlCA)
@interface RGLRFIDAccessControlCA : NSObject

@property (nonatomic, copy) NSString *keyAlgorithm;
@property (nonatomic, copy) NSString *scheme;
@property (nonatomic, assign) NSInteger version;
@property (nonatomic, assign) BOOL chipIndividual;

RGL_EMPTY_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
