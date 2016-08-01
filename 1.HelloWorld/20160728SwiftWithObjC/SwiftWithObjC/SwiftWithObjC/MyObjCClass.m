//
//  MyObjCClass.m
//  HelloWithObjC
//
//  Created by Kent Liu on 2015/2/8.
//  Copyright (c) 2015年 Kent Liu. All rights reserved.
//

#import "MyObjCClass.h"

@implementation MyObjCClass

- (NSString*) sayHello {
    
    self.date = [NSDate date];
    
    return @"Hi! I come from ObjC!";
    
}

@end
