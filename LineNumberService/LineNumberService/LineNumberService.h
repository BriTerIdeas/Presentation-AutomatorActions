//
//  LineNumberService.h
//  LineNumberService
//
//  Created by Brian Slick on 5/13/14.
//  Copyright (c) 2014 BriTer Ideas LLC. All rights reserved.
//

#import <Automator/AMBundleAction.h>

@interface LineNumberService : AMBundleAction

- (id)runWithInput:(id)input error:(NSError **)error;

@end
