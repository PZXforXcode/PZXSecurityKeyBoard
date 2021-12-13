//
//  ViewController.m
//  PZXSecurityKeyBoard
//
//  Created by quark123321 on 2020/11/30.
//

#import "ViewController.h"
#import "PZXInputView.h"
#import "LicensePlateInputView.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITextInputTraits>

@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (strong, nonatomic)  PZXInputView *inputView;
- (IBAction)securityButtonPressed:(UIButton *)sender;
- (IBAction)outputStringButtonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *CarTF;
@property(strong, nonatomic)LicensePlateInputView *carInput;

@end

@implementation ViewController
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
//    _inputView.frame = CGRectMake(0, 0, 200, 240+self.view.safeAreaInsets.bottom);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.tf.inputDelegate = self;
    _inputView = [[PZXInputView alloc]initWithFrame:CGRectMake(0, 0, 200, 260)];
    _inputView.backgroundColor = [UIColor whiteColor];
    _inputView.layer.borderWidth = 1;
    _inputView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _inputView.tf = self.tf;

    self.tf.inputView = _inputView;
    self.tf.isPlaintext = YES;
    
    
    //车牌号键盘用法
    _carInput = [[LicensePlateInputView alloc]init];
    __weak typeof(self)weakSelf = self;
    _carInput.sendTextBlock = ^(NSString * _Nonnull plateString) {
        weakSelf.CarTF.text = plateString;
    };
   [self.CarTF addTarget:self action:@selector(textChanged:) forControlEvents:UIControlEventEditingChanged];
    self.CarTF.inputView = self.carInput;

    
}

//用这个方法把变换的值传回给input 为了切换键盘样式
-(void)textChanged:(UITextField *)textField{
    NSLog(@"%@",textField.text);
    //这里样将键盘值传回plateStr，让键盘切换
    self.carInput.plateStr = textField.text;
}

- (IBAction)outputStringButtonPressed:(UIButton *)sender {
    
    NSString *string = @"";
    if (self.tf.isPlaintext) {
        
        string = self.tf.text;

    }else{
        string = self.tf.secureText;
    }
    
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"字符串为：%@",string] message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction  *right =[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    

    [alert addAction:right];
    [self presentViewController:alert animated:YES completion:nil];
}


- (IBAction)securityButtonPressed:(UIButton *)sender {
    
    sender.selected = !sender.selected;

    self.tf.isPlaintext = !sender.selected;

    if (self.tf.isPlaintext) {

        self.tf.text = self.tf.secureText;

    }else{


    }
    
    
}
@end
