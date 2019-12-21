//
//  DUQRScaner.m
//  DUQRCode
//
//  Created by dongchenxi on 2019/12/21.
//  Copyright © 2019 dongchenxi. All rights reserved.
//

#import "DUQRScaner.h"
#import "DUQRScanVC.h"

@implementation DUQRScaner

+ (void)scanQRCode:(void(^)(UIViewController *scanVC ,NSString *result))completion {
    [self scanQRCodePresentByViewController:[(UIWindow *)UIApplication.sharedApplication.windows.firstObject rootViewController]
                                 completion:completion];
}

+ (void)scanQRCodePresentByViewController:(UIViewController *)vc
                               completion:(void(^)(UIViewController *scanVC ,NSString *result))completion {
    UIViewController *rootVC = vc;
    DUQRScanVC *scanVC = [[DUQRScanVC alloc] init];
    [rootVC presentViewController:scanVC
                         animated:YES
                       completion:nil];
    [scanVC startWithCompletion:^(NSString * _Nonnull result) {
        if (completion) {
            completion(scanVC, result);
        }
    }];
}
     
     

@end
