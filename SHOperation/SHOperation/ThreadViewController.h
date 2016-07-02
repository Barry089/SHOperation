//
//  ThreadViewController.h
//  SHOperation
//
//  Created by Li Zhe on 7/2/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThreadViewController : UIViewController {
    //定义线程对象01
    NSThread *_thread01;
    //定义线程对象02
    NSThread *_thread02;
    //定义一个计数器
    NSInteger _counter;
    // 定义一个线程锁对象
    NSLock *_lock;
}
@end
