//
//  ViewController.m
//  Interview
//
//  Created by Shawn Webster on 8/07/2015.
//  Copyright © 2015 Shawn Webster. All rights reserved.
//

#import "ViewController.h"

#import "Interview-Swift.h"

#import "CCIArraysAndStrings.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)test_matrixRotation {
    // Do any additional setup after loading the view, typically from a nib.
    
    TestClass *instance = [TestClass new];
    NSLog(@"%@", instance.string);
    NSLog(@"%@", [instance returnSomething]);
    
    NSString *originalString = @"two spaces here";
    NSMutableString *inString = [NSMutableString stringWithFormat:@"%@////", originalString];
    [CCIArraysAndStrings encodeSpaces:inString length:originalString.length];
    NSLog(@"%@", inString);
    
    int n = 10;
    int **matrix;
    
    //allocate space for the array
    matrix = malloc(sizeof(int*) * n);
    for (NSInteger i=0; i<n; i++) {
        matrix[i] = malloc(sizeof(int) * n);
    }
    
    //put stuff into the array
    for (NSInteger i=0; i<n*n; i++) {
        matrix[i/n][i%n] = (int)i+1;
    }
    
    for (int i=0; i<4; i++) {
        [CCIArraysAndStrings rotate:(int**)matrix n:n];
    }
    
    //free up the space
    for (NSInteger i=0; i<n; i++) {
        free(matrix[i]);
    }
    free(matrix);
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
