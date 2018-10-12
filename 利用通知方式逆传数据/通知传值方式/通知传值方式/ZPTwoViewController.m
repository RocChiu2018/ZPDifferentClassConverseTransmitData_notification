//
//  ZPTwoViewController.m
//  通知传值方式
//
//  Created by apple on 16/7/4.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ZPTwoViewController.h"
#import "ZPStudent.h"

@interface ZPTwoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *sexTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end

@implementation ZPTwoViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark ————— 点击“保存”按钮 —————
- (IBAction)clickSaveButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    ZPStudent *student = [[ZPStudent alloc] init];
    
    student.name = self.nameTextField.text;
    student.sex = self.sexTextField.text;
    student.age = self.ageTextField.text;
    
    /**
     设置通知：
     分别解释以下设置通知方法中的各个参数的意义：
     notificationWithName:后面的参数是指通知的名称；
     object:后面的参数是指谁哪个类将要发送通知；
     userInfo:后面的参数是指发送通知的时候所携带的字典。
     */
    NSNotification *notification = [NSNotification notificationWithName:@"abc" object:self userInfo:[NSDictionary dictionaryWithObject:student forKey:@"student"]];
    
    //发送通知：把上面设置好的通知作为发送通知方法postNotification:后面的参数发送出去，从而达到逆传数据的目的。
    [[NSNotificationCenter defaultCenter] postNotification:notification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
