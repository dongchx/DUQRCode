//
//  DUQRScaner.h
//  DUQRCode
//
//  Created by dongchenxi on 2019/12/21.
//  Copyright © 2019 dongchenxi. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DUQRScaner : NSObject

+ (void)scanQRCode:(void(^)(UIViewController *scanVC ,NSString *result))completion;

+ (void)scanQRCodePresentByViewController:(UIViewController *)vc
                               completion:(void(^)(UIViewController *scanVC ,NSString *result))completion;

@end

NS_ASSUME_NONNULL_END
