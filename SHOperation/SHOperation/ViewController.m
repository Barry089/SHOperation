//
//  ViewController.m
//  SHOperation
//
//  Created by Li Zhe on 7/1/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+AFNetworking.h"

#define profileUrl @"http://i1.ce.cn/Europe_Biz/hqbl/main/gd/200708/13/W020070813400174885420.jpg"

@interface ViewController () <NSURLSessionTaskDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 355, 367)];
    [self.view addSubview:_imageView];
//    //_imageView.image = [UIImage imageNamed:@"e6705fe4jw8f47s2r4vpsj218g0owaoa.jpg"];
//    // Do any additional setup after loading the view, typically from a nib.
//    //视频学习：
//    for (int i=0; i<2; i++) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//        btn.frame = CGRectMake(100, 100 + 50 * i, 200, 30);
//        btn.tag = 101 + i;
//        [self.view addSubview:btn];
//        
//        [btn addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
//        if (i == 0) {
//            [btn setTitle:@"Add 任务1到队列中" forState:UIControlStateNormal];
//        }
//        else {
//            [btn setTitle:@"添加任务2到队列中" forState:UIControlStateNormal];
//        }
//    }
//    _queue = [[NSOperationQueue alloc] init];
//    [_queue setMaxConcurrentOperationCount:5];
//    
//}
//
//- (void)pressBtn:(id)sender {
//    UIButton *btn = (UIButton *)sender;
//    if (btn.tag == 101) {
//        //方法一：创建一个执行任务
//        //P1: 任务函数的拥有者
//        //P2: 任务函数的执行体
//        //P3: 任意参数
//        NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(operationAct01:) object:@"OPT01"];
//        [_queue addOperation:invocationOperation];
//        
//        //方法二：来实现任务
////        NSInvocation *invocation = [[NSInvocation alloc] init];
////        invocation.target = self;
////        invocation.selector = @selector(operationAct02:);
////        NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithInvocation:invocation];
////        [_queue addOperation:operation];
//    }
//    else if (btn.tag == 102) {
//        // 使用block语法块来进行任务处理。block是单独处理的，即单独开辟一个路径；这一条路径不会死机的。
//        [_queue addOperationWithBlock:^{
//            while (true) {
//                NSLog(@"Block opt BlockBlockBlock");
//            }
//        }];
//    }
//}
    NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self
                                                                           selector:@selector(downloadImage:)
                                                                             object:profileUrl];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    [queue addOperation:operation];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)downloadImage:(NSString *)url{
    NSLog(@"url:%@", url);
    NSURL *nsUrl = [NSURL URLWithString:url];
    NSData *data = [[NSData alloc]initWithContentsOfURL:nsUrl];
    UIImage * image = [[UIImage alloc]initWithData:data];
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:image waitUntilDone:YES];
}

-(void)updateUI:(UIImage*)image {
    self.imageView.image = image;
}


- (void)operationAct01:(NSInvocationOperation *)invoOperation {
    while (true) {
        NSLog(@"Operation Queue 111111111");
    }
}

- (void)operationAct02:(NSInvocationOperation *)invocOperation {
    while (true) {
        NSLog(@"operationQueue  AAAAct22222");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
