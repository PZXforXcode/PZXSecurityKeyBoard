//
//  LicensePlateInputView.h
//  PZXSecurityKeyBoard
//
//  Created by 彭祖鑫 on 2021/12/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LicensePlateInputView : UIInputView

@property (nonatomic,weak)id<UIKeyInput> keyInput;

//车牌字符
@property (nonatomic,strong)NSString *plateStr;
//点击键盘回调
@property (nonatomic,copy)void (^sendTextBlock)(NSString *plateString);

-(instancetype)init;

@end

NS_ASSUME_NONNULL_END
