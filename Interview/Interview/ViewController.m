//
//  ViewController.m
//  Interview
//
//  Created by Shawn Webster on 8/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "ViewController.h"

#import "Interview-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestClass *instance = [TestClass new];
    NSLog(@"%@", instance.string);
    NSLog(@"%@", [instance returnSomething]);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
