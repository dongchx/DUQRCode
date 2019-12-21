//
//  DUQRScanVC.h
//  DUQRCode
//
//  Created by dongchenxi on 2019/12/21.
//  Copyright © 2019 dongchenxi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DDDebugLog NSLog(@"%@ %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));

NS_ASSUME_NONNULL_BEGIN

typedef  void (^DUQRScanCompletion)(NSString *result);

@interface DUQRScanVC : UIViewController

- (void)startWithCompletion:(DUQRScanCompletion)completion;

@end

NS_ASSUME_NONNULL_END
