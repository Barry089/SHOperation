//
//  ViewController.h
//  SHOperation
//
//  Created by Li Zhe on 7/1/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSOperationQueue *_queue; //Declare an operation queue object;任务队列对象用来保存多个任务，这些任务可以同时来执行，其实是多线程来完成的。
}

@end

