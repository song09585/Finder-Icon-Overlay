//
//  FinderIconOverlayExample.m
//  FinderIconOverlayExample
//
//  Created by Les Nie on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FinderIconOverlayExample.h"
#import "ListViewIconOverlay.h"
#import "IconViewIconOverlay.h"

@implementation FinderIconOverlayExample

+ (FinderIconOverlayExample*) sharedInstance
{
	static FinderIconOverlayExample* plugin = nil;
	
	if (plugin == nil) {
		plugin = [[FinderIconOverlayExample alloc] init];
    }
	
	return plugin;
}

+ (void) load
{
	[ListViewIconOverlay pluginLoad];
    [IconViewIconOverlay pluginLoad];
	return;
}


@end
