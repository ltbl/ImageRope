//
//  G9DropZoneView.m
//  ImageRope
//
//  Created by kkung on 12. 8. 28..
//  Copyright (c) 2012년 GAE9.COM. All rights reserved.
//

#import "G9DropZoneView.h"

@implementation G9DropZoneView

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self registerForDraggedTypes:[NSArray arrayWithObjects:NSFilenamesPboardType, nil]];
    }
    
    return self;
}

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender
{
    return NSDragOperationGeneric;
}

- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender
{
    return YES;
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender
{
    NSArray* items = [[sender draggingPasteboard] propertyListForType:NSFilenamesPboardType];
    [[self dropZoneDelegate] dropReceived:items];
    
    return YES;
}

@end
