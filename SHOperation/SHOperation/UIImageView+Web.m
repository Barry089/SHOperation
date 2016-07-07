//
//  UIImageView+Web.m
//  SHOperation
//
//  Created by Li Zhe on 7/2/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import "UIImageView+Web.h"

@implementation UIImageView (Web)

- (void)setImageWithUrl:(NSString *)urlStr complete:(void (^)(BOOL success))completeBlock {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString:urlStr];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *t_image = [UIImage imageWithData:data];
        //NSLog(@"Save to photosAlbum");
        //UIImageWriteToSavedPhotosAlbum(t_image, nil, nil, nil);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if (t_image) {
                completeBlock(YES);
            }
            else {
                completeBlock(NO);
            }
            self.image = t_image;
        });
    });
}
@end
