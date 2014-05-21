//
//  LineNumberService.m
//  LineNumberService
//
//  Created by Brian Slick on 5/13/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

#import "LineNumberService.h"

#import "StringProcessor.h"

#define kSelectedSegmentIndexKey            @"com.briterideas.selectedSegmentIndex"

@interface LineNumberService ()

@property (nonatomic, weak) IBOutlet NSSegmentedControl *spacesSegmentedControl;

@end

@implementation LineNumberService

- (id)runWithInput:(id)input
             error:(NSError **)error
{
    if (![input isKindOfClass:[NSArray class]])
    {
        return input;
    }
    
    NSInteger selectedIndex = [[[self parameters] objectForKey:kSelectedSegmentIndexKey] integerValue];
    NSInteger numberOfSpaces = selectedIndex + 1;
    
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
        NSString *outputString = [StringProcessor formattedOutputFromInput:inputString numberOfSpaces:numberOfSpaces];
        
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

- (void)opened
{
    NSLog(@">>> Entering <%p> %s <<<", self, __PRETTY_FUNCTION__);
    
    NSMutableDictionary *parameters = [self parameters];
    
    if ([parameters objectForKey:kSelectedSegmentIndexKey] == nil)
    {
        [parameters setObject:@2 forKey:kSelectedSegmentIndexKey];
    }
    
    [self parametersUpdated];
    
    [super opened];
    
    NSLog(@"<<< Leaving  <%p> %s >>>", self, __PRETTY_FUNCTION__);
}

- (void)updateParameters
{
    NSLog(@">>> Entering <%p> %s <<<", self, __PRETTY_FUNCTION__);
    
    NSMutableDictionary *parameters = [self parameters];

    [parameters setObject:@([[self spacesSegmentedControl] selectedSegment]) forKey:kSelectedSegmentIndexKey];
    
    NSLog(@"<<< Leaving  <%p> %s >>>", self, __PRETTY_FUNCTION__);
}

- (void)parametersUpdated
{
    NSLog(@">>> Entering <%p> %s <<<", self, __PRETTY_FUNCTION__);
    
    NSMutableDictionary *parameters = [self parameters];
    
    NSInteger selectedIndex = [[parameters objectForKey:kSelectedSegmentIndexKey] integerValue];
    
    [[self spacesSegmentedControl] setSelectedSegment:selectedIndex];
    
    NSLog(@"<<< Leaving  <%p> %s >>>", self, __PRETTY_FUNCTION__);
}

@end
