//
//  RFIDErrorCodes+Private.h
//  DocumentReader
//
//  Created by Serge Rylko on 5.02.26.
//  Copyright © 2026 Regula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <DocumentReader/RGLRFIDNotify.h>

NS_ASSUME_NONNULL_BEGIN

NSString *RGLStringErrorCodeFromRFIDErrorCode(RGLRFIDErrorCodes errorCode) NS_SWIFT_NAME(DocReader.stringCode(from:));

NS_ASSUME_NONNULL_END
