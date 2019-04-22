//
//  main.m
//  runtimeStudy
//
//  Created by 冯思 on 2019/3/13.
//  Copyright © 2019 冯思. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Person.h"
#import <objc/runtime.h>
#import <objc/message.h>
int main(int argc, char * argv[]) {
    @autoreleasepool {
        NSLog(@"开始");
        //该函数的作用是获取类的实例所占用内存的大小（单位是字节）
        NSLog(@"等于=%zd", class_getInstanceSize([Person class]));
        
        int re=UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
        NSLog(@"结束");
        return re;
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
