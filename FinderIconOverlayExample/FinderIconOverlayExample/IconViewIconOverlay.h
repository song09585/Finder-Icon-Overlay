//
//  IconViewIconOverlay.h
//  FinderIconOverlayExample
//
//  Created by Les Nie on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Quartz/Quartz.h>
#import "Finder.h"

@interface IconViewIconOverlay : IKImageBrowserCell

+ (void)pluginLoad;
- (void)FO_drawImage:(id)fp8;
@end
