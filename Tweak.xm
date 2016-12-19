#import <AppSupport/CPBitmapStore.h>
#import <UIKit/UIKeyboardCache.h>

@interface UIKBRenderConfig : NSObject
- (BOOL)lightKeyboard;
- (BOOL)whiteText;
@end

@interface UIKBBackgroundView : UIView
@property (nonatomic, retain) UIKBRenderConfig *renderConfig;
@end

@interface UIKeyboardPredictionCell : UIView
@end

@interface _UIBackdropEffectView : UIView
- (id)init;
@end

@interface UIKBBackdropView : UIView
@property (nonatomic, retain) UIView *grayscaleTintView;
@property (nonatomic, retain) _UIBackdropEffectView *backdropEffectView;
- (void)setBackdropVisibilitySetOnce:(BOOL)arg1;
- (void)setBackdropVisible:(BOOL)arg1;
- (void)setBlurFilterWithRadius:(float)arg1 blurQuality:(id)arg2;
- (void)setBlurQuality:(id)arg1;
- (void)setBlurRadius:(float)arg1;
- (void)setBlurRadiusSetOnce:(BOOL)arg1;
- (void)setBackdropEffectView:(_UIBackdropEffectView *)arg1;
@end

@interface UIKBGradient : NSObject
+ (id)gradientWithFlatColor:(id)arg1;
@end

@interface UIKBRenderTraits : NSObject
@property (nonatomic, retain) UIKBGradient *layeredBackgroundGradient;
@property (nonatomic, retain) UIKBGradient *layeredForegroundGradient;
- (void)setBlurBlending:(BOOL)arg1;
- (void)setBlendForm:(int)arg1;
@end

@interface UIKBRenderFactory
@property (nonatomic, retain) UIKBRenderConfig *renderConfig;
@end

@interface UIKBRenderFactoryiPhone : UIKBRenderFactory
@end

@interface UIKBRenderFactoryiPad : UIKBRenderFactory
@end

@interface UIKBRenderFactoryiPadLandscape : UIKBRenderFactory
@end

@interface UIKBRenderFactoryiPhonePasscode : UIKBRenderFactory
@end

@interface UIKBRenderFactoryiPadPasscode : UIKBRenderFactory
@end

@interface UIKBRenderFactoryiPadLandscapePasscode : UIKBRenderFactory
@end

@interface UIToolbar (AndYou)
@property (setter=_setBackgroundView:, nonatomic, retain) UIImageView *_backgroundView;
@end

#pragma mark - Keyboard hooks

BOOL override = NO;

#pragma mark - iPhone

%hook UIKBRenderFactoryiPhone

+ (id)alloc {
  if (override) {
    override = NO;
    return %orig;
  } else {
    return [%c(UIKBRenderFactoryiPhonePasscode) alloc];
  }
}

- (id)_traitsForKey:(id)arg1 onKeyplane:(id)arg2 {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    [traits setBlurBlending:YES];
  }
  return traits;
}

- (id)shiftLockControlKeyTraits {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    traits.layeredForegroundGradient = [%c(UIKBGradient) gradientWithFlatColor:@"UIKBColorBlack"];
  }
  return traits;
}
%end

%hook UIKBRenderFactoryiPad

+ (id)alloc {
  return override ? %orig : [%c(UIKBRenderFactoryiPadPasscode) alloc];
}

- (id)_traitsForKey:(id)arg1 onKeyplane:(id)arg2 {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    [traits setBlurBlending:YES];
  }
  return traits;
}

- (id)shiftLockControlKeyTraits {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    traits.layeredForegroundGradient = [%c(UIKBGradient) gradientWithFlatColor:@"UIKBColorBlack"];
  }
  return traits;
}
%end

%hook UIKBRenderFactoryiPadLandscape

+ (id)alloc {
  return override ? %orig : [%c(UIKBRenderFactoryiPadLandscapePasscode) alloc];
}

- (id)_traitsForKey:(id)arg1 onKeyplane:(id)arg2 {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    [traits setBlurBlending:YES];
  }
  return traits;
}

- (id)shiftLockControlKeyTraits {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    traits.layeredForegroundGradient = [%c(UIKBGradient) gradientWithFlatColor:@"UIKBColorBlack"];
  }
  return traits;
}
%end

%hook UIKBRenderFactoryiPhonePasscode

+ (id)alloc {
  override = YES;
  return %orig;
}

- (id)_traitsForKey:(id)arg1 onKeyplane:(id)arg2 {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    [traits setBlurBlending:YES];
  }
  return traits;
}

- (id)shiftLockControlKeyTraits {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    traits.layeredForegroundGradient = [%c(UIKBGradient) gradientWithFlatColor:@"UIKBColorBlack"];
  }
  return traits;
}
%end

%hook UIKBRenderFactoryiPadPasscode

+ (id)alloc {
  override = YES;
  return %orig;
}

- (id)_traitsForKey:(id)arg1 onKeyplane:(id)arg2 {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    [traits setBlurBlending:YES];
  }
  return traits;
}

- (id)shiftLockControlKeyTraits {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    traits.layeredForegroundGradient = [%c(UIKBGradient) gradientWithFlatColor:@"UIKBColorBlack"];
  }
  return traits;
}
%end

%hook UIKBRenderFactoryiPadLandscapePasscode

+ (id)alloc {
  override = YES;
  return %orig;
}

- (id)_traitsForKey:(id)arg1 onKeyplane:(id)arg2 {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    [traits setBlurBlending:YES];
  }
  return traits;
}

- (id)shiftLockControlKeyTraits {
  UIKBRenderTraits *traits = %orig;
  UIKBRenderConfig *renderConfig = self.renderConfig;
  if ([renderConfig lightKeyboard]) {
    traits.layeredForegroundGradient = [%c(UIKBGradient) gradientWithFlatColor:@"UIKBColorBlack"];
  }
  return traits;
}
%end

#pragma mark - Render config

%hook UIKBRenderTraits
- (NSInteger)blendForm {
  return 0;
}
%end

%hook UIKBRenderConfig
- (NSInteger)forceQuality {
  if ([self lightKeyboard]) {
    return 10;
  }
  return %orig;
}

- (double)keycapOpacity {
  if (![self lightKeyboard]) {
    return 0.2f;
  }
  return %orig;
}
%end

%hook UIKBBackdropView
- (void)layoutSubviews {
  %orig;
  CGFloat white;
  CGFloat alpha;
  [[self.grayscaleTintView backgroundColor] getWhite:&white alpha:&alpha];
  if (white > 0.5) {
    self.grayscaleTintView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1];
  }
}

- (id)initWithFrame:(id)arg1 style:(int)arg2 primaryBackdrop:(BOOL)arg3 {
  UIKBBackdropView *orig = %orig;
  CGFloat white;
  [[orig.grayscaleTintView backgroundColor] getWhite:&white alpha:nil];
  if (white > 0.5) {
    orig.alpha = 0.95;
    orig.grayscaleTintView.alpha = 0.9;
  }

  return orig;
}
%end

%hook UITextInputTraits
- (BOOL)suppressReturnKeyStyling {
  return YES;
}
%end

%hook UIKeyboardPredictionCell
- (id)textColor {
  UIKBBackgroundView *backgroundView;
  object_getInstanceVariable(self.superview, "m_backgroundView", (void **)&backgroundView);
  if (backgroundView && [backgroundView.renderConfig lightKeyboard]) {
    return [UIColor blackColor];
  }

  return %orig;
}
%end

#pragma mark - Web Form

%hook UIWebFormAccessory
+ (id)toolbarWithItems:(id)arg1 {
  UIToolbar *toolbar = %orig;
  UIKBRenderConfig *renderConfig;
  object_getInstanceVariable(self, "_renderConfig", (void **)&renderConfig);
  if (renderConfig && [renderConfig whiteText]) {
    toolbar.tintColor = [UIColor whiteColor];
  } else {
    toolbar.tintColor = [UIColor blackColor];
  }
  return toolbar;
}

- (void)layoutSubviews {
  %orig;

  UIToolbar *leftToolbar;
  UIToolbar *rightToolbar;
  object_getInstanceVariable(self, "_leftToolbar", (void **)&leftToolbar);
  object_getInstanceVariable(self, "_rightToolbar", (void **)&rightToolbar);
  if (leftToolbar) {
    leftToolbar._backgroundView.alpha = 0;
  }
  if (rightToolbar) {
    rightToolbar._backgroundView.alpha = 0;
  }
}
%end

#pragma mark - SpringBoard hooks

%group SpringBoardHooks
%hook SpringBoard

- (void)applicationDidFinishLaunching:(UIApplication *)application {
  %orig;

  CPBitmapStore *store = MSHookIvar<CPBitmapStore *>([%c(UIKeyboardCache) sharedInstance], "_store");
  [store purge];
}

%end
%end

#pragma mark - Constructor

%ctor {
  if (IN_SPRINGBOARD) {
    %init(SpringBoardHooks);
  }

  %init;
}
