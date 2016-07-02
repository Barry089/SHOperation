//
//  UIImageView+Web.h
//  SHOperation
//
//  Created by Li Zhe on 7/2/16.
//  Copyright © 2016 SH10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Web)
- (void)setImageWithUrl:(NSString *)urlStr complete:(void (^)(BOOL success))completeBlock;
@end
