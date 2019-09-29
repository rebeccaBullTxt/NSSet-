//
//  ViewController.m
//  NSSet使用
//
//  Created by 刘渊 on 2019/9/29.
//  Copyright © 2019 刘渊. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test1];
}

/*
 NSSet跟NSArray的区别：散列存与顺序存储的区别。体现在查找速度上的差别。都存放cocoa对象。在查找速度上NSSet比NSArray更快。
 NSDictionary则可以存储键值对，这个键值对也是无序的，键通常是一个字符串(唯一的)，而值可以是任意类型的对象
 */
- (void)test1{
    //1、初始化
    NSSet *set1 = [NSSet setWithObjects:@"abc",@"def", nil];
    NSSet *set2 = [[NSSet alloc] initWithObjects:@"1",@111,@222, nil];
//    NSLog(@"set1 count = %ld, set2 count = %ld",[set1 count],[set2 count]);
    //2、遍历
    NSEnumerator *enumer = [set2 objectEnumerator];
    id object;
    while ((object = [enumer nextObject]) != nil) {
//        NSLog(@"object = %@",object);
    }
    [set1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
//        NSLog(@"obj = %@",obj);
    }];
    //3、查找
    if ([set1 containsObject:@"111"]) {
//        NSLog(@"true");
    }
    //4、增删
    NSMutableSet * assets = [[NSMutableSet alloc] init];
    [assets addObject:@"111"];
    [assets addObject:@"222"];
    [assets addObject:@"333"];
    [assets removeObject:@"333"];
    [assets removeAllObjects];
    //5、拼接
    NSSet *set3 = [[NSSet alloc] init];
    set3 = [set3 setByAddingObjectsFromArray:@[@"3",@"6",@"9",@"1"]];
    NSLog(@"set3 = %@",set3);
    set3 = [set2 setByAddingObjectsFromSet:set3];
    NSLog(@"set3 = %@",set3);
    //数据不重复
}

@end
