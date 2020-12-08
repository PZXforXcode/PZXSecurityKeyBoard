# PZXSecurityKeyBoard
一款简易的身份证键盘，使用方便适合简单项目，也可修改源码达到自己想要的效果，（后续会增加不同键盘样式，需要特殊样式可以issues 联系我更新样式）
## 效果图:
![image](https://github.com/PZXforXcode/PZXSecurityKeyBoard/blob/master/keyboard.gif)   
## Usage:

```Objective-C
.m
#import "PZXInputView.h"

@property (strong, nonatomic)  PZXInputView *inputView;

    _inputView = [[PZXInputView alloc]initWithFrame:CGRectMake(0, 0, 200, 260)];
    _inputView.backgroundColor = [UIColor whiteColor];
    _inputView.layer.borderWidth = 1;
    _inputView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _inputView.tf = self.tf;

    self.tf.inputView = _inputView;


```
