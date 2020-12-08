//
//  UIView+BorderLine.h
//  PZXSecurityKeyBoard
//
//  Created by quark123321 on 2020/11/30.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};


NS_ASSUME_NONNULL_BEGIN

@interface UIView (BorderLine)

- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType;


@end

NS_ASSUME_NONNULL_END
