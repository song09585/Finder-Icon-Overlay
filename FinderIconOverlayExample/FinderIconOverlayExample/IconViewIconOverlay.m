//
//  IconViewIconOverlay.m
//  FinderIconOverlayExample
//
//  Created by Les Nie on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "IconViewIconOverlay.h"
#import "FinderIconOverlayExample.h"
#include <objc/objc.h>
#include <objc/runtime.h>

@implementation IconViewIconOverlay

+ (void)pluginLoad
{
    Method old, new;
	Class self_class = [self class];
    Class finder_class = [objc_getClass("IKImageBrowserCell") class];
    
    class_addMethod(finder_class, @selector(FO_drawImage:),
                    class_getMethodImplementation(self_class, @selector(FO_drawImage:)),"v@:@");
	
	old = class_getInstanceMethod(finder_class, @selector(drawImage:));
	new = class_getInstanceMethod(finder_class, @selector(FO_drawImage:));
	method_exchangeImplementations(old, new);

}

- (void)FO_drawImage:(id)fp8
{
    NSString *title = [self previewItemTitle];
    if ([[title lowercaseString] hasPrefix:@"a"]) {
        NSImage *icon = [fp8 _nsImage];
        
        NSRect frame = [self imageFrame];
        NSLog(@"drawing width %.0f for name '%@' icon %@",frame.size.width,title,icon);
        [icon lockFocus];
        CGContextRef myContext = [[NSGraphicsContext currentContext] graphicsPort];
        CGContextSetRGBFillColor (myContext, 1, 0, 0, 1);
        CGContextFillRect (myContext, CGRectMake (0, 0, 10, 10 ));
        [icon unlockFocus];
        [self FO_drawImage:[[[IKImageWrapper alloc] initWithNSImage:icon] autorelease]];
        
    } else {
        [self FO_drawImage:fp8];
    }
}

@end
