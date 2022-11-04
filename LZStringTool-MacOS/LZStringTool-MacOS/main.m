//
//  main.m
//  LZStringTool
//
//  Created by 王贵彬  on 2022/11/4.
//

#import <Foundation/Foundation.h>
#import "LZStringObjc.h"

// 1. 编译之后取出LZStringTool执行 chmod a+x LZStringTool  放到环境变量里去就可以方便使用了

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
   NSString *docStr = WrapStr(
                                   ======= [ 欢迎使用 LZStringTool ] ==========\n
                                   -h  查看文档\n
                                   -s  传入需要转换的原字符串\n
                                   -c  编码\n
                                   -d  解码 \n
                                   -t  转换类型(base64/utf16/unit8/uri) 默认使用utf16
                                       其中unit8类型解码时传递的是数组 类似这样 '1,2,3,4'这样
                              \n \n 参考以下示例代码\n
                              \n LZStringTool -v
                              \n   LZStringTool -h
                              \n   LZStringTool -e -t 'base64' -s 'hello'
                              \n   LZStringTool -d -t 'base64' -s 'BYUwNmD2Q==='
                              \n   LZStringTool -e -t 'utf16' -s 'hello'
                              \n   LZStringTool -d -t 'utf16' -s 'ˢ䰭䰾搠'
                              \n   ./LZStringTool -e -t 'unit8' -s 'hello'
                              \n   ./LZStringTool -d -t 'unit8' -s '55,129,176,166,7,96,230,2,224,22,0,32,47,2,10,192,26,4,8,192,158,51,0,206,200,32,3,0,30,1,176,1,193,106,20,12,96,197,1,152,11,228,0,0'
                              \n  ./LZStringTool -e -t 'uri' -s 'hello'
                              \n  ./LZStringTool -d -t 'uri' -s 'BYUwNmD2Q'
                              \n  ./LZStringTool -e  -s 'hello'
                              \n  ./LZStringTool -d  -s 'օ〶惶䀀'
                               \n =============================================
);
        
        
        NSMutableString *args = [NSMutableString string];
        for(int i = 0; i < argc; i++){
            [args appendString:[NSString stringWithCString:argv[i] encoding:NSUTF8StringEncoding]];
            [args appendString:@","];
        }
        if(argc <= 1){
            puts([docStr UTF8String]);
            return 0;
        }
        
        if ([args containsString:@"-v"]) {
            puts("v1.0.0");
            return 0;
        }
        
        if ([args containsString:@"-h"]) {
            puts([docStr UTF8String]);
            return 0;
        }
        
        LZStringObjc *LZ = [LZStringObjc sharedInstance];
        BOOL isEncode = [args containsString:@"-e"];
        BOOL isDecode = [args containsString:@"-d"];
        NSString *type = [[NSUserDefaults standardUserDefaults] stringForKey:@"t"];
        NSString *inputStr = [[NSUserDefaults standardUserDefaults] stringForKey:@"s"];
        if ([type isEqualToString:@"base64"]) {
            if(isEncode){
                puts([LZ compressToBase64:inputStr].UTF8String);
            }
            if(isDecode){
                puts([LZ decompressFromBase64:inputStr].UTF8String);
            }
            return 0;
        }
        if ([type isEqualToString:@"utf16"]) {
            if(isEncode){
                puts([LZ compressToUTF16:inputStr].UTF8String);
            }
            if(isDecode){
                puts([LZ decompressFromUTF16:inputStr].UTF8String);
            }
            return 0;
        }
        
        if ([type isEqualToString:@"uri"]) {
            if(isEncode){
                puts([LZ compressToEncodedURIComponent:inputStr].UTF8String);
            }
            if(isDecode){
                puts([LZ decompressFromEncodedURIComponent:inputStr].UTF8String);
            }
            return 0;
        }
        
        if ([type isEqualToString:@"unit8"]) {
            if(isEncode){
                NSArray *arr = [LZ compressToUint8Array:inputStr];
                puts([arr componentsJoinedByString:@","].UTF8String);
            }
            if(isDecode){
                NSArray *inputArr = [inputStr componentsSeparatedByString:@","];
                puts([LZ decompressFromUint8Array:inputArr].UTF8String);
            }
            return 0;
        }
        
        if(!type || type.length == 0){
            if(isEncode){
                puts([LZ compress:inputStr].UTF8String);
            }
            
            if(isDecode){
                puts([LZ decompress:inputStr].UTF8String);
            }
            return 0;
        }
        
        puts("入参错误,请参考文档:\n");
        puts([docStr UTF8String]);
    }
    return 0;
}
