
#import <Foundation/Foundation.h>
#import <DocumentReader/RGLMacros.h>

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(RGLRFIDAccessControlPACE)
@interface RGLRFIDAccessControlPACE : NSObject

@property (nonatomic, copy) NSString *keyAlgorithm;
@property (nonatomic, copy) NSString *stdDomainParams;
@property (nonatomic, assign) NSInteger version;

RGL_EMPTY_INIT_UNAVAILABLE

@end

NS_ASSUME_NONNULL_END
