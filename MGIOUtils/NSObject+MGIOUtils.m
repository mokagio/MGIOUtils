// NSObject+MGIOUtils.h
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

#import "NSObject+MGIOUtils.h"
#import "NSFileManager+MGIOUtils.h"

@implementation NSObject (MGIOUtils)

#pragma mark - Dictionary from Bundled File

- (NSDictionary *)dictionaryFromFileNamed:(NSString *)fileName withExtension:(NSString *)fileExtension
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileExtension];
    
    return [NSDictionary dictionaryWithContentsOfFile:filePath];
}

- (NSDictionary *)dictionaryFromPlistNamed:(NSString *)fileName
{
    return [self dictionaryFromFileNamed:fileName withExtension:@"plist"];
}

- (NSDictionary *)dictionaryFromJSONNamed:(NSString *)jsonName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:jsonName ofType:@"json"];
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:kNilOptions error:nil];
}

#pragma mark - Array from Bundled File

- (NSMutableArray *)arrayFromJSONNamed:(NSString *)fileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:kNilOptions error:nil];
}

- (NSMutableArray *)arrayFromPlistNamed:(NSString *)fileName
{
    return [self arrayFromFileName:fileName withExtension:@"plist"];
}

- (NSMutableArray *)arrayFromFileName:(NSString *)fileName withExtension:(NSString *)fileExtension
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:fileExtension];
    
    return [NSMutableArray arrayWithContentsOfFile:filePath];
}

#pragma mark - Dictionary from Local File

- (NSDictionary *)dictionaryFromLocalPlistNamed:(NSString *)fileName
{
    return [self dictionaryFromLocalFileNamed:fileName withExtension:@"plist"];
}

- (NSDictionary *)dictionaryFromLocalJSONNamed:(NSString *)jsonName
{
    NSString *filePath = [NSFileManager pathForFileLocally:jsonName withExtension:@"json"];
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:kNilOptions error:nil];
}

- (NSDictionary *)dictionaryFromLocalFileNamed:(NSString *)fileName withExtension:(NSString *)fileExtension
{
    NSString *filePath = [NSFileManager pathForFileLocally:fileName withExtension:fileExtension];
    
    return [NSDictionary dictionaryWithContentsOfFile:filePath];
}

#pragma mark - Array from Local File

- (NSMutableArray *)arrayFromLocalFileNamed:(NSString *)fileName withExtension:(NSString *)fileExtension
{
    NSString *filePath = [NSFileManager pathForFileLocally:fileName withExtension:fileExtension];
    return [NSMutableArray arrayWithContentsOfFile:filePath];
}

- (NSMutableArray *)arrayFromLocalPlistNamed:(NSString *)fileName
{
    return [self arrayFromLocalFileNamed:fileName withExtension:@"plist"];
}

#pragma mark - Write Dictionary

- (void)writeDictionary:(NSDictionary *)dictionary inFileNamed:(NSString *)name extension:(NSString *)extension
{
    NSString *path = [NSFileManager pathForFileLocally:name withExtension:extension];
    [dictionary writeToFile:path atomically:YES];
}

- (void)writeDictionary:(NSDictionary *)dictionary inPlistFileNamed:(NSString *)name
{
    return [self writeDictionary:dictionary inFileNamed:name extension:@"plist"];
}

- (void)writeDictionary:(NSDictionary *)dictionary inJSONFileNamed:(NSString *)name
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:NSJSONWritingPrettyPrinted error:nil];
    
    NSString *path = [NSFileManager pathForFileLocally:name withExtension:@"json"];
    [jsonData writeToFile:path atomically:YES];
}

#pragma mark - Write Array

- (void)writeArray:(NSMutableArray *)array inFileNamed:(NSString *)name extension:(NSString *)extension
{
    NSString *path = [NSFileManager pathForFileLocally:name withExtension:extension];
    [array writeToFile:path atomically:YES];
}

- (void)writeArray:(NSMutableArray *)array inPlistNamed:(NSString *)name
{
    return [self writeArray:array inFileNamed:name extension:@"plist"];
}

- (void)writeArray:(NSMutableArray *)array inJSONNamed:(NSString *)name
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array
                                                       options:NSJSONWritingPrettyPrinted error:nil];
    NSString *path = [NSFileManager pathForFileLocally:name withExtension:@"json"];
    [jsonData writeToFile:path atomically:YES];
}


@end
