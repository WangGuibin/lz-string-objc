//
//  LZStringObjc.h
//  Demo
//
//  Created by 王贵彬 on 2022/11/4.
//

#import <Foundation/Foundation.h>
#define WrapStr(...)  [[NSString alloc] initWithCString:#__VA_ARGS__ encoding:NSUTF8StringEncoding]

NS_ASSUME_NONNULL_BEGIN

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
