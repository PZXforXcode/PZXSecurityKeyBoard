//
//  PZXInputView.m
//  PZXSecurityKeyBoard
//
//  Created by quark123321 on 2020/12/8.
//

#import "PZXInputView.h"


#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@implementation PZXInputView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderWidth = 1;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        for (int i = 0; i<12; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.layer.borderWidth = 0.5;
            button.layer.borderColor = [UIColor lightGrayColor].CGColor;
            button.tag = 100+i;
            button.frame = CGRectMake((i%3)*SCREENWIDTH/3, (i/3)*60, SCREENWIDTH/3, 60);
            [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];

            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            if (i<9) {
                [button setTitle:[NSString stringWithFormat:@"%ld",(long)i+1] forState:UIControlStateNormal];
            }else if(i==9){//X按钮
                
                [button setTitle:@"X" forState:UIControlStateNormal];
                //                [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];//可自己替换图片
                [button  borderForColor:[UIColor lightGrayColor] borderWidth:1.f borderType:UIBorderSideTypeBottom];
                
            }else if(i==10){
                
                [button setTitle:@"0" forState:UIControlStateNormal];
                [button  borderForColor:[UIColor lightGrayColor] borderWidth:1.f borderType:UIBorderSideTypeBottom];


            }else if(i==11){//退格按钮
                
                [button setTitle:@"<" forState:UIControlStateNormal];
//                [button setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];//可自己替换图片
                [button  borderForColor:[UIColor lightGrayColor] borderWidth:1.f borderType:UIBorderSideTypeBottom];

            }

            [self addSubview:button];

        }
        
        
    }
    return self;
}

-(void)buttonPressed:(UIButton *)sender{
    
    if (sender.tag == 111) {//退格
        
        [self.tf deleteBackward];
        if (self.tf.secureText.length > 0) {
            self.tf.secureText = [self.tf.secureText substringToIndex:([self.tf.secureText length]-1)];// 去掉最后一个","
        }

    }else{
        [self keyboardOfTouchWithText:sender.titleLabel.text];
    }
    
    
}

- (void)keyboardOfTouchWithText:(NSString*)text{
    
    if (self.tf.isPlaintext) {
        
        [self.tf insertText:text];
        self.tf.secureText = [self.tf.secureText stringByAppendingString:text];



    }else{
        
        self.tf.secureText = [self.tf.secureText stringByAppendingString:text];
        [self.tf insertText:@"•"];
    }
}

- (void)setTf:(UITextField *)tf{
    
    _tf = tf;
}
@end
