//
//  ViewController.h
//  定时器和视图对象
//
//  Created by zh dk on 2017/8/21.
//  Copyright © 2017年 zh dk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    //定义一个定时器对象，可以每隔一段时间发送一个消息
    NSTimer *_timerview;
}

//定时器的属性对象
@property (retain,nonatomic) NSTimer *timerview;

@end

