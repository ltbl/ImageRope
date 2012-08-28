//
//  G9DropZoneView.h
//  ImageRope
//
//  Created by kkung on 12. 8. 28..
//  Copyright (c) 2012년 GAE9.COM. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "G9DropZoneDelegate.h"

@interface G9DropZoneView : NSView {
    id<G9DropZoneDelegate> dropZoneDelegate;
}

@property (nonatomic, weak) id<G9DropZoneDelegate> dropZoneDelegate;

@end
