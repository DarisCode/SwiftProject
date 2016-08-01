//
//  ViewController.m
//  ObjCWithSwift
//
//  Created by Financialbrain on 2016/7/28.
//  Copyright © 2016年 DarisCode. All rights reserved.
//

#import "ViewController.h"

///If you import multi Swift , only need to import below one

#import "ObjCWithSwift-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
    MySwiftClass * swiftObj = [MySwiftClass new];
    
    NSString * result = [swiftObj sayHello];
    NSDate * date = swiftObj.date;
    
    ///General Alert
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:date.description message:result preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:ok];
    [self presentViewController:alert animated:true completion:nil];
    
}

@end
