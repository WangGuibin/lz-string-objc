//
//  WGBViewController.m
//  lz-string-objc
//
//  Created by CoderWGB on 11/04/2022.
//  Copyright (c) 2022 wangguibin1993@gmail.com. All rights reserved.
//

#import "WGBViewController.h"
#import <LZStringObjc.h>

@interface WGBViewController ()

@end

@implementation WGBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    LZStringObjc *LZ = [LZStringObjc sharedInstance];
    //base64
    NSLog(@"%@",[LZ compressToBase64:@"hello"]);
    NSLog(@"%@",[LZ decompressFromBase64:@"BYUwNmD2Q==="]);
    
    //utf16
    NSLog(@"%@",[LZ compressToUTF16:@"hello"]);
    NSLog(@"%@",[LZ decompressFromUTF16:@"ˢ䰭䰾搠"]);
    
    //unit8
    NSLog(@"%@",[LZ compressToUint8Array:@"hello"]);
    NSString *str = @"55,129,176,166,7,96,230,2,224,22,0,32,47,2,10,192,26,4,8,192,158,51,0,206,200,32,3,0,30,1,176,1,193,106,20,12,96,197,1,152,11,228,0,0";
    NSArray *strArr = [str componentsSeparatedByString:@","];
    NSLog(@"%@",[LZ decompressFromUint8Array:strArr]);
    
    //uri
    NSLog(@"%@",[LZ compressToEncodedURIComponent:@"hello"]);
    NSLog(@"%@",[LZ decompressFromEncodedURIComponent:@"BYUwNmD2Q"]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
