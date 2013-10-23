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

#import <Foundation/Foundation.h>

@interface NSObject (MGIOUtils)

- (NSDictionary *)dictionaryFromFileNamed:(NSString *)fileName withExtension:(NSString *)fileExtension;
- (NSDictionary *)dictionaryFromPlistNamed:(NSString *)fileName;
- (NSDictionary *)dictionaryFromJSONNamed:(NSString *)jsonName;

- (NSDictionary *)dictionaryFromLocalFileNamed:(NSString *)fileName withExtension:(NSString *)fileExtension;
- (NSDictionary *)dictionaryFromLocalPlistNamed:(NSString *)fileName;
- (NSDictionary *)dictionaryFromLocalJSONNamed:(NSString *)fileName;

- (NSMutableArray *)arrayFromFileName:(NSString *)fileName withExtension:(NSString *)fileExtension;
- (NSMutableArray *)arrayFromPlistNamed:(NSString *)fileName;
- (NSMutableArray *)arrayFromJSONNamed:(NSString *)fileName;

- (NSMutableArray *)arrayFromLocalFileNamed:(NSString *)fileName withExtension:(NSString *)fileExtension;
- (NSMutableArray *)arrayFromLocalPlistNamed:(NSString *)fileName;

- (void)writeDictionary:(NSDictionary *)dictionary inFileNamed:(NSString *)name extension:(NSString *)extension;
- (void)writeDictionary:(NSDictionary *)dictionary inPlistFileNamed:(NSString *)name;
- (void)writeDictionary:(NSDictionary *)dictionary inJSONFileNamed:(NSString *)name;

- (void)writeArray:(NSMutableArray *)array inFileNamed:(NSString *)name extension:(NSString *)extension;
- (void)writeArray:(NSMutableArray *)array inPlistNamed:(NSString *)name;
- (void)writeArray:(NSMutableArray *)array inJSONNamed:(NSString *)name;

@end
