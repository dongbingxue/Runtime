//
//  ViewController.m
//  Swizzling
//
//  Created by dbx on 15/8/25.
//  Copyright (c) 2015年 shilinglong. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "NSArray+Swizzle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    static void *ClassNameTableViewContent = &ClassNameTableViewContent;
   // [self arraySwizzling];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)arraySwizzling{
    Method ori_Method = class_getInstanceMethod([NSArray class], @selector(lastObject));
    Method my_Method = class_getInstanceMethod([NSArray class], @selector(myLastObject));
    method_exchangeImplementations(ori_Method, my_Method);
}

@end
