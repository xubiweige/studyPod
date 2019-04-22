//
//  Person.m
//  runtimeStudy
//
//  Created by 冯思 on 2019/3/18.
//  Copyright © 2019 冯思. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
@implementation Person
//重写父类方法：处理类方法
+ (BOOL)resolveClassMethod:(SEL)sel{
    if(sel == @selector(haveMeal:)){
        class_addMethod(object_getClass(self), sel, class_getMethodImplementation(object_getClass(self), @selector(zs_haveMeal:)), "v@");
//        (objc_getClassclass_addMethod(self), sel, <#IMP  _Nonnull imp#>, <#const char * _Nullable types#>)
        return YES;   //添加函数实现，返回YES
    }
    return [class_getSuperclass(self) resolveClassMethod:sel];
}
//重写父类方法：处理实例方法
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if(sel == @selector(singSong:)){
        class_addMethod([self class], sel, class_getMethodImplementation([self class], @selector(zs_singSong:)), "v@");
        return YES;
    }
//    if (sel=@selector(<#selector#>)) {
//        <#statements#>
//    }
    return [super resolveInstanceMethod:sel];
}


+ (void)zs_haveMeal:(NSString *)food{
    NSLog(@"%s",__func__);
}

- (void)zs_singSong:(NSString *)name{
    NSLog(@"%s",__func__);
}
@end
