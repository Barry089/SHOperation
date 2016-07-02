//
//  ThreadViewController.m
//  SHOperation
//
//  Created by Li Zhe on 7/2/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import "ThreadViewController.h"

@interface ThreadViewController ()

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    for (int i=0; i<3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [self.view addSubview:btn];
        btn.frame = CGRectMake(100, 100+80*i, 100, 40);
        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 101+i;
        if (i==0) {
            [btn setTitle:@"启动线程" forState:UIControlStateNormal];
        }
        else if (i==1) {
            [btn setTitle:@"启动线程01" forState:UIControlStateNormal];
        }
        else {
            [btn setTitle:@"启动线程02" forState:UIControlStateNormal];
        }
    }
    //因为多线程是不安全的，原因：当act1：中的counter在自增的时候，有可能cpu资源被其他线程抢断，导致其自增失败，从而少加一次或多次；对于act2:也是类似。针对这一状况，可以给线程加锁，作用是其所在的线程所占用的cpu资源不被抢占，保证其成功完成。
    _lock = [[NSLock alloc] init];
    
    //[self performSelectorInBackground:@selector(<#selector#>) withObject:nil];
}
- (void)pressBtn:(UIButton *)button {
    if (button.tag == 101) {
        //Create a thread object
        //P1:The owner of thread object
        //P2:the function of thread perform
        //P3:the thread's parameter
        _thread01 = [[NSThread alloc] initWithTarget:self selector:@selector(act1:) object:nil];
        // start to run the thread
        [_thread01 start];
    }
    else if (button.tag == 102) {
        _thread02 = [[NSThread alloc] initWithTarget:self selector:@selector(act02:) object:nil];
        [_thread02 start];
    }
    else if (button.tag == 103) {
        // 创建并启动线程
        [NSThread detachNewThreadSelector:@selector(act03:) toTarget:self withObject:nil];
    }
}
//P1:线程对象本身；
- (void)act1:(NSThread *)thread {
    int i = 0;
    while (true) {
        i++;
        if (i>10000) {
            break;
        }
        //确保加法操作安全
        [_lock lock];
        _counter ++;
        [_lock unlock];
        NSLog(@"act1 counter = %ld", _counter);
    }
    NSLog(@"c1 final= %ld", _counter);
}

- (void)act02:(NSThread *)thread {
    int i = 0;
    while (true) {
        i++;
        if (i>10000) {
            break;
        }
        [_lock lock];
        _counter ++;
        [_lock unlock];
        NSLog(@"act2  counter = %ld", _counter);
    }
    NSLog(@"c2 final = %ld", _counter);
}

- (void)act03:(NSThread *)thread {
    while (true) {
        NSLog(@"Act333333 doing"); }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
