// NSFileManager+MGIOUtils.m
//
// Copyright (c) 2013 Giovanni Lodi (mokagio42@gmail.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "NSFileManager+MGIOUtils.h"

@implementation NSFileManager (MGIOUtils)

#pragma mark - Paths

+ (NSString *)pathForFileLocally:(NSString *)name
{
    return [[self documentDirectoryPath] stringByAppendingPathComponent:name];
}

+ (NSString *)pathForPlistLocally:(NSString *)name
{
    return [self pathForFileLocally:name withExtension:@"plist"];
}

+ (NSString *)pathForJSONLocally:(NSString *)name
{
    return [self pathForFileLocally:name withExtension:@"json"];
}

+ (NSString *)pathForFileLocally:(NSString *)name withExtension:(NSString *)extension
{
    return [[self documentDirectoryPath] stringByAppendingPathComponent:
            [NSString stringWithFormat: @"%@.%@", name, extension]];
}

+ (NSString *)documentDirectoryPath
{
    // The static + dispatch_once approach breaks when used from the pod. WHY?
//    static NSString *path = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
//                                                    NSUserDomainMask, YES) lastObject];
//        NSAssert(path, @"No document directory?");
//    });
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                          NSUserDomainMask, YES) lastObject];
    return path;
}

#pragma mark - File Exists Locally

- (BOOL)fileExistsLocally:(NSString *)name withExtension:(NSString *)extension
{
    NSString *filePath = [NSFileManager pathForFileLocally:name withExtension:extension];
    
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

- (BOOL)fileExistsLocally:(NSString *)name
{
    NSString *filePath = [NSFileManager pathForFileLocally:name];
    
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

- (BOOL)plistExistsLocally:(NSString *)name
{
    return [self fileExistsLocally:name withExtension:@"plist"];
}

- (BOOL)jsonExistsLocally:(NSString *)name
{
    return [self fileExistsLocally:name withExtension:@"json"];
}

#pragma mark - File Exists in Main Bundle

- (BOOL)fileExistsInMainBundle:(NSString *)name withExtension:(NSString *)extension
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:extension];
    
    return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}

- (BOOL)fileExistsInMainBundle:(NSString *)name
{
    return [self fileExistsInMainBundle:name withExtension:nil];
}

@end
