//
//  StringProcessor.m
//  LineNumberService
//
//  Created by Brian Slick on 5/13/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

#import "StringProcessor.h"

@implementation StringProcessor

+ (NSString *)formattedOutputFromInput:(NSString *)inputString
                        numberOfSpaces:(NSInteger)numberOfSpaces;
{
    if ([inputString length] == 0)
    {
        return inputString;
    }
    
    NSArray *inputLines = [inputString componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    __block NSMutableArray *outputLines = [NSMutableArray array];
    
    NSString *whitespace = @"";
    while ([whitespace length] < numberOfSpaces)
    {
        whitespace = [whitespace stringByAppendingString:@" "];
    }
    NSString *longestLineNumber = [NSString stringWithFormat:@"%ld.%@", [outputLines count], whitespace];
    NSInteger maxPrefixLength = [longestLineNumber length];
    
    [inputLines enumerateObjectsUsingBlock:^(NSString *originalLine, NSUInteger index, BOOL *stop) {
        
        NSString *cleanLine = [originalLine stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        // Make sure that text left-aligns 5 characters out.  Ex:
        //  1.   stuff
        //  10.  stuff
        //  100. stuff
        
        NSString *prefix = [NSString stringWithFormat:@"%ld. ", index + 1];
        
        while ([prefix length] < maxPrefixLength)
        {
            prefix = [prefix stringByAppendingString:@" "];
        }
        
        NSString *numberedLine = [prefix stringByAppendingString:cleanLine];
        
        [outputLines addObject:numberedLine];
        
    }];
    
    NSString *outputString = [outputLines componentsJoinedByString:@"\n"];
    
    return outputString;
}

@end
