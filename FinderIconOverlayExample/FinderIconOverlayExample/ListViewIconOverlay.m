//
//  ListViewIconOverlay.m
//  FinderIconOverlayExample
//
//  Created by Les Nie on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ListViewIconOverlay.h"
#import "FinderIconOverlayExample.h"
#include <objc/objc.h>
#include <objc/runtime.h>

@implementation ListViewIconOverlay

+ (void)pluginLoad
{
    Method old, new;
	Class self_class = [self class];
    Class finder_class = [objc_getClass("TIconAndTextCell") class];
	
	
	class_addMethod(finder_class, @selector(FO_drawIconWithFrame:),
                    class_getMethodImplementation(self_class, @selector(FO_drawIconWithFrame:)),"v@:{CGRect={CGPoint=dd}{CGSize=dd}}");
	
	old = class_getInstanceMethod(finder_class, @selector(drawIconWithFrame:));
	new = class_getInstanceMethod(finder_class, @selector(FO_drawIconWithFrame:));
	method_exchangeImplementations(old, new);
    
}

- (void) FO_drawIconWithFrame:(struct CGRect)arg1
{
    [self FO_drawIconWithFrame:arg1];
    NSString *title = [self objectValue];
    if ([[title lowercaseString] hasPrefix:@"a"]) {
        CGContextRef myContext = [[NSGraphicsContext currentContext] graphicsPort];
        CGContextSetRGBFillColor (myContext, 1, 0, 0, 1);
        CGContextFillRect (myContext, CGRectMake (0, 0, 10, 10 ));
    }
}

@end
