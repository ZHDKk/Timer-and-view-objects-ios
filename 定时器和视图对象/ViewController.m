//
//  ViewController.m
//  定时器和视图对象
//
//  Created by zh dk on 2017/8/21.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//属性和成员变量的同步
@synthesize timerview = _timerview;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //启动定时器按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(100, 100, 80, 40);
    [btn setTitle:@"启动定时器" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(pressStart) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //停止定时器按钮
    UIButton *btnStop = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btnStop.frame = CGRectMake(100, 200, 80, 40);
    [btnStop setTitle:@"停止定时器" forState:UIControlStateNormal];
    [btnStop addTarget:self action:@selector(pressStop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnStop];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(0, 0, 80, 80);
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    //设置view的标签值，通过父视图对象以及view的标签值可以获得相应的视图对象
    view.tag = 101;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   }

//按下启动按钮
-(void) pressStart{
    //创建一个定时器
    //每隔多长时间调用一次,以秒为单位
    //表示实现定时器函数的对象
    //定时器函数
    //可以定时器函数中的一个函数，无参数可以传nil
    //定时器是否重复操作YES为重复调用，NO不重复
    _timerview= [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateTimer:) userInfo:@"小明" repeats:YES];
}
//定时器函数
//可以将定时器本身作为参数传入
-(void) updateTimer:(NSTimer*) timer{
    NSLog(@"测试!  name= %@",timer.userInfo);
    
    UIView *view = [self.view viewWithTag:101];
    view.frame = CGRectMake(view.frame.origin.x+1, view.frame.origin.y+1, 80, 80);
}
//按下停止按钮
-(void) pressStop{
    if (_timerview !=nil) {
        //停止定时器
        [_timerview invalidate];
    }
}



@end
