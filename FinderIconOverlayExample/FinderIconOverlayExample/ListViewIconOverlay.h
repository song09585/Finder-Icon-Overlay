//
//  ListViewIconOverlay.h
//  FinderIconOverlayExample
//
//  Created by Les Nie on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Finder.h"

@interface ListViewIconOverlay : NSCell

+ (void) pluginLoad;
- (void) FO_drawIconWithFrame:(struct CGRect)arg1;

@end
