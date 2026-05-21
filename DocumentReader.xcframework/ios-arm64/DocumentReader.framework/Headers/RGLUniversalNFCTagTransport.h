
#import <Foundation/Foundation.h>
#import <DocumentReader/RGLMacros.h>

@class NFCISO7816APDU;

NS_ASSUME_NONNULL_BEGIN

NS_SWIFT_NAME(RGLUniversalNFCTagTransport)
@protocol RGLUniversalNFCTagTransport

- (void)sendApduCommand:(NSData * _Nonnull)data completionHandler:(void(^)(NSData *responseData, uint8_t sw1, uint8_t sw2, NSError * _Nullable error))completionHandler
NS_SWIFT_NAME(sendApduCommand(data:completionHandler:));

@end

NS_ASSUME_NONNULL_END
