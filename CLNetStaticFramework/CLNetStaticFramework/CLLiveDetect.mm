//
//  CLLiveDetect.m
//  CLNetStaticFramework
//
//  Created by Leo on 2018/11/30.
//  Copyright © 2018 Leo. All rights reserved.
//

#import "CLLiveDetect.h"
#import <MGBaseKit/MGBaseKit.h>
#import <MGLivenessDetection/MGLivenessDetection.h>

@implementation CLLiveDetect

+ (void)startLiveDetectWithViewControler:(UIViewController *)viewController complete:(void (^)(BOOL, NSError * error))complete {
    
    [MGLicenseManager licenseForNetWokrFinish:^(bool License) {
        if (License) {
            NSLog(@"SDK 授权【成功】");
            [CLLiveDetect startDetectionViewController:viewController complete:complete];
        }else{
            NSLog(@"SDK 授权【失败】");
        }
    }];

}

+ (void)startDetectionViewController:(UIViewController *)viewcontroller complete:(void (^)(BOOL, NSError * error))complete {
    MGLiveManager *manager = [[MGLiveManager alloc] init];
    manager.detectionWithMovier = NO;//关闭活体检测录像功能
    
    [manager startFaceDecetionViewController:viewcontroller finish:^(FaceIDData *finishDic, UIViewController *viewController) {
        
        NSData *header = [[finishDic images] valueForKey:@"image_best"];
        /*获取活体检测中的质量最好的人脸图像*/
        UIImage *image = [UIImage imageWithData:header];
        if (complete) {
            NSLog(@"调起活体检测成功了！！！！");
            complete(YES,nil);
        }
        [viewController dismissViewControllerAnimated:YES completion:nil];
        
    } error:^(MGLivenessDetectionFailedType errorType, UIViewController *viewController) {
        [viewController dismissViewControllerAnimated:YES completion:nil];
        NSLog(@"调起活体检测失败了！！！！");
    }];

}

@end
