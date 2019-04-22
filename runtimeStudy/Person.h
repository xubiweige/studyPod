//
//  Person.h
//  runtimeStudy
//
//  Created by 冯思 on 2019/3/18.
//  Copyright © 2019 冯思. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign, getter = isTall) BOOL tall;
@property (nonatomic, assign, getter = isRich) BOOL rich;
@property (nonatomic, assign, getter = isHansome) BOOL handsome;
//声明类方法，但未实现
+ (void)haveMeal:(NSString *)food;
//声明实例方法，但未实现
- (void)singSong:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
