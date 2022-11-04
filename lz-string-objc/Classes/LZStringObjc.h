//
//  LZStringObjc.h
//  lz-string-objc
//
//  Created by 王贵彬 on 2022/11/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// 站在巨人的肩膀上造轮子
// https://github.com/pieroxy/lz-string  一个js压缩库
// 本轮子解决OC简单的调用问题 无需自己动手去写算法  直接通过js去调用lz-string.js的接口 

@interface LZStringObjc : NSObject

+ (LZStringObjc *)sharedInstance;

- (NSString *)compressToBase64:(NSString *)str;
- (NSString *)decompressFromBase64:(NSString *)str;


- (NSString *)compressToUTF16:(NSString *)str;
- (NSString *)decompressFromUTF16:(NSString *)str;


- (NSArray *)compressToUint8Array:(NSString *)str;
- (NSString *)decompressFromUint8Array:(NSArray *)strArr;


- (NSString *)compressToEncodedURIComponent:(NSString *)str;
- (NSString *)decompressFromEncodedURIComponent:(NSString *)str;


- (NSString *)compress:(NSString *)str;
- (NSString *)decompress:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
