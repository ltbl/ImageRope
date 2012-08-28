//
//  G9AppDelegate.h
//  ImageRope
//
//  Created by kkung on 12. 8. 28..
//  Copyright (c) 2012년 GAE9.COM. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "G9ImageRoper.h"
#import "G9DropZoneView.h"
#import "G9DropZoneDelegate.h"

@interface G9AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDelegate, NSTableViewDataSource, G9DropZoneDelegate> {
    
    NSMutableArray *images;
    
}

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSTextField *labelInform;
@property (weak) IBOutlet G9DropZoneView *dropZoneView;

@end
