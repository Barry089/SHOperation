//
//  GCDViewController.m
//  SHOperation
//
//  Created by Li Zhe on 7/2/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import "GCDViewController.h"
#import "UIImageView+Web.h"
#import "ViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /**
    dispatch_queue_t myqueue = dispatch_queue_create("com.SH10.Barry", NULL);
    dispatch_async(myqueue, ^{
        NSLog(@"--- >%d", [NSThread currentThread] == [NSThread mainThread]);
        [NSThread sleepForTimeInterval:2];
        NSLog(@"6666666");
    });
    //dispatch_async(myqueue, ^{
      //  NSLog(@"7777777");
    //});
     */
    
    /*
    dispatch_queue_t myqueue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(myqueue2, ^{
        NSLog(@"--- > %d", [NSThread currentThread] == [NSThread mainThread]);
        [NSThread sleepForTimeInterval:2];
        NSLog(@"2342");
    });
    dispatch_async(myqueue2, ^{
        NSLog(@"7880097");
    });
     */
    
    /*
    dispatch_queue_t myqueue3 = dispatch_get_main_queue();
    dispatch_async(myqueue3, ^{
        NSLog(@"==== > %d", [NSThread currentThread] == [NSThread mainThread]);
        [NSThread sleepForTimeInterval:2];
        NSLog(@"545u04544");
    });
    
    //dispatch_async(myqueue3, ^{
      //  NSLog(@"down99877442222110");
    //});
     */
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 355, 400)];
    [imgView setImageWithUrl:@"http://tva4.sinaimg.cn/crop.0.7.888.888.1024/e6705fe4jw8f47s2r4vpsj218g0owaoa.jpg" complete:^(BOOL success) {
        if (success) {
            NSLog(@"Successful...");
        }
        else {
            NSLog(@"Failure!");
        }
    }];
    [self.view addSubview:imgView];
    [self.view sendSubviewToBack:imgView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 450, 88, 40);
    [btn setTitle:@"Push VC" forState:UIControlStateNormal];
}

- (void)buttonClick {
    NSLog(@"push viewcon");
    ViewController *vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
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
