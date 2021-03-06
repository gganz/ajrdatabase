//
//  NSWindowFix.m
//  AJRDatabase
//
//  Created by Alex Raftis on 10/1/04.
//  Copyright 2004 __MyCompanyName__. All rights reserved.
//

#import "NSWindowFix.h"


@implementation NSWindowFix

+ (void)load
{
	[self poseAsClass:[NSWindow class]];
}

- (void)sendEvent:(NSEvent *)event
{
	if ([event type] == NSKeyDown) {
		if ([[self firstResponder] isKindOfClass:[NSTextView class]]) {
			[super sendEvent:event];
			return;
		} else {
			if ([[self firstResponder] processKeyDown:event]) return;
			if ([[self delegate] processKeyDown:event]) return;
			if ([[NSApp delegate] processKeyDown:event]) return;
		}
	}
		
	[super sendEvent:event];
}

@end


@implementation NSObject (NSWindowFix)

- (BOOL)processKeyDown:(NSEvent *)event
{
	return NO;
}

@end
