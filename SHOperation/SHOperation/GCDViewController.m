//
//  GCDViewController.m
//  SHOperation
//
//  Created by Li Zhe on 7/2/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import "GCDViewController.h"
#import "UIImageView+Web.h"

@interface GCDViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong, readonly) UIImage *image;
@end

@implementation GCDViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awake froam nib");
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    NSLog(@"status bar style");
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"view didload");
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 450, 80, 40)];
    [self.view addSubview:label];
    label.text = @"asdfasfdattt";
    //label.tintColor = self.view.tintColor;
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
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 500, 200, 100)];
    [self.view addSubview:_imageView];
    _imageView.backgroundColor = [UIColor orangeColor];
    _imageView.image = imgView.image;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 450, 88, 40);
    [btn setTitle:@"Push VC" forState:UIControlStateNormal];
    
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
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Save Image to Album UIImageWriteToSavedPhotosAlbum(photo.image, self, @selector(method:), nil);
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //[tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
    
    // Fire off an asynchronous task, giving UIKit the opportunity to redraw wit the HUD added to the view hierarchy.
    dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^{
        //do something...
        
        // IMPORTANT - Dispatch back to the main thread.
        dispatch_async(dispatch_get_main_queue(), ^{
            // Always access UI classed (including MBProgressHUD) on the main thread.
        });
    });
    
    int64_t delayInSeconds = 2.0;
    /**
     @p1 dispatch_time_t when
     @p2 int64_t delta
     */
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    
    /**
     // 大概意思进行popTime 之后，执行主线程
     @p1 dispatch_time_t when
     @p2 dispatch_queue_t queue
     @p3 ^(void)block
     */
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        // update view...
    });
}

- (void)buttonClick {
    [self performSegueWithIdentifier:@"ThreadVC" sender:self];
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
