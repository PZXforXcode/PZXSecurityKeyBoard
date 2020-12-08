//
//  ViewController.m
//  PZXSecurityKeyBoard
//
//  Created by quark123321 on 2020/11/30.
//

#import "ViewController.h"
#import "UIView+BorderLine.h"
#import "UITextField+Security.h"
#import "PZXInputView.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITextInputTraits>

@property (weak, nonatomic) IBOutlet UITextField *tf;
@property (strong, nonatomic)  PZXInputView *inputView;
- (IBAction)securityButtonPressed:(UIButton *)sender;
- (IBAction)outputStringButtonPressed:(UIButton *)sender;

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
