//
//  LineNumberService.m
//  LineNumberService
//
//  Created by Brian Slick on 5/13/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

#import "LineNumberService.h"

#import "StringProcessor.h"

@implementation LineNumberService

- (id)runWithInput:(id)input
             error:(NSError **)error
{
    if (![input isKindOfClass:[NSArray class]])
    {
        return input;
    }
    
    NSArray *inputArray = (NSArray *)input;
    NSMutableArray *outputArray = [NSMutableArray array];
    
    for (id inputObject in inputArray)
    {
        if (![inputObject isKindOfClass:[NSString class]])
        {
            [outputArray addObject:inputObject];
            
            continue;
        }
        
        NSString *inputString = (NSString *)inputObject;
        NSString *outputString = [StringProcessor formattedOutputFromInput:inputString];
        
        if (outputString != nil)
        {
            [outputArray addObject:outputString];
        }
        else
        {
            [outputArray addObject:inputObject];
        }
    }
    
    return outputArray;
}

@end
