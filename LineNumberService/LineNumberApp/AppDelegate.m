//
//  AppDelegate.m
//  LineNumberApp
//
//  Created by Brian Slick on 5/13/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

#import "AppDelegate.h"

#import "StringProcessor.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	NSURL *url = [[NSBundle mainBundle] URLForResource:@"sampleInput" withExtension:@"txt"];
    
	NSString *inputString = [[NSString alloc] initWithContentsOfURL:url
                                                           encoding:NSUTF8StringEncoding
                                                              error:nil];
    
	NSLog(@"\ninput:\n-----\n%@\n-----", inputString);
    
    NSString *outputString = [StringProcessor formattedOutputFromInput:inputString numberOfSpaces:2];
    
	NSLog(@"\nfinal output:\n-----\n%@\n-----", outputString);
}

@end
