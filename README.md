# lz-string-objc

[![CI Status](https://img.shields.io/travis/wangguibin1993@gmail.com/lz-string-objc.svg?style=flat)](https://travis-ci.org/wangguibin1993@gmail.com/lz-string-objc)
[![Version](https://img.shields.io/cocoapods/v/lz-string-objc.svg?style=flat)](https://cocoapods.org/pods/lz-string-objc)
[![License](https://img.shields.io/cocoapods/l/lz-string-objc.svg?style=flat)](https://cocoapods.org/pods/lz-string-objc)
[![Platform](https://img.shields.io/cocoapods/p/lz-string-objc.svg?style=flat)](https://cocoapods.org/pods/lz-string-objc)

## Introduce
 
站在巨人的肩膀上造轮子
https://github.com/pieroxy/lz-string  一个js压缩库
本轮子只是为了`OC`方便调用的问题,通过`js`去调用`lz-string.js`的接口 

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
```objc
    #import <LZStringObjc.h>

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

```
## Requirements

## Installation

lz-string-objc is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'lz-string-objc'
```

## Author

CoderWGB, 864562082@qq.com

## License

lz-string-objc is available under the MIT license. See the LICENSE file for more info.
