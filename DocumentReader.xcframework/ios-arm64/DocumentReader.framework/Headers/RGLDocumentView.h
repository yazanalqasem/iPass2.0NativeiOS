#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, RGLDocumentViewPosition) {
    RGLDocumentViewPositionBottomLeft,
    RGLDocumentViewPositionBottomRight,
    RGLDocumentViewPositionLeft,
    RGLDocumentViewPositionCenter
} NS_SWIFT_NAME(DocumentViewPosition);

typedef void (^RGLCompletion)(void);

@class RGLDocumentView;
@protocol RGLDocumentViewDataSource <NSObject>
- (UIView *_Nonnull)parentView:(RGLDocumentView *_Nullable)documentView;
- (UIView *_Nonnull)mainParentView:(RGLDocumentView *_Nullable)documentView;
- (CGFloat)parentViewYMultiplier:(RGLDocumentView *_Nullable)documentView;
@end

NS_SWIFT_NAME(DocumentView)
@interface RGLDocumentView : UIImageView

@property(nonatomic, weak, nullable) id<RGLDocumentViewDataSource> dataSource;

@property(nonatomic, strong) UIImage * _Nullable helpAnimationImage;
@property(nonatomic, strong) UIImage * _Nullable multipageFrontAnimationImage;
@property(nonatomic, strong) UIImage * _Nullable multipageBackAnimationImage;

@property(nonatomic, assign) UIViewContentMode helpAnimationImageContentMode;
@property(nonatomic, assign) UIViewContentMode multipageAnimationFrontImageContentMode;
@property(nonatomic, assign) UIViewContentMode multipageAnimationBackImageContentMode;
@property(nonatomic, assign) BOOL useFlipMultipageAnimation;

- (instancetype _Nonnull)initWithStartPosition:(RGLDocumentViewPosition)position;
- (void)startHelpAnimationWithCompletion:(RGLCompletion _Nullable)completion;
- (void)changePositionToDocumentViewPosition:(RGLDocumentViewPosition)documentPosition;
- (void)nextPageAnimationStart;

@end
