//
//  ZPOneViewController.m
//  通知传值方式
//
//  Created by apple on 16/7/4.
//  Copyright © 2016年 apple. All rights reserved.
//

/**
 应用通知有三个步骤：
 1、注册通知；
 2、设置通知；
 3、发送通知。
 */
#import "ZPOneViewController.h"
#import "ZPStudent.h"

@interface ZPOneViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@end

@implementation ZPOneViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //注册通知
    [self registerNotification];
}

#pragma mark ————— 注册通知 —————
- (void)registerNotification
{
    /**
     注册通知：
     分别解释以下注册通知方法中的各个参数的意义：
     observer:后面的参数是指接收到通知以后调用哪个类里面的方法；
     selector:后面的参数是指接收到通知以后要调用哪个方法，在这里要写方法的名称；
     name:后面的参数是指这个通知的名称，一般可以写系统自带的通知名称或者自拟的通知名称；
     object:后面的参数是指本类接收谁发出的通知，如果写为nil的话则表示接收来自任何类发出的通知。
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showInformation:) name:@"abc" object:nil];
}

#pragma mark ————— 显示资料 —————
/**
 下面方法中的参数notification是指其他类中调用发送通知方法postNotification:后面的那个参数，这样就把其他类中的数据通过那个参数逆传过来了。
 */
-(void)showInformation:(NSNotification *)notification
{
    NSLog(@"notification = %@", notification);
    
    ZPStudent *student = [notification.userInfo objectForKey:@"student"];
    
    self.nameLabel.text = student.name;
    self.sexLabel.text = student.sex;
    self.ageLabel.text = student.age;
}

#pragma mark ————— 本视图控制器销毁的时候调用 —————
//在这个方法里面必须要移除之前注册的通知
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
