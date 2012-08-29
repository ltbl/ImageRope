//
//  G9AppDelegate.m
//  ImageRope
//
//  Created by kkung on 12. 8. 28..
//  Copyright (c) 2012년 GAE9.COM. All rights reserved.
//

#import "G9AppDelegate.h"

@implementation G9AppDelegate
@synthesize tableView;
@synthesize labelInform;
@synthesize dropZoneView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    images = [[NSMutableArray alloc] init];
    [tableView setDelegate:self];
    [tableView setDataSource:self];
    [dropZoneView setDropZoneDelegate:self];
}

- (void)application:(NSApplication *)sender openFiles:(NSArray *)filenames
{
    [self dropReceived:filenames];
}

- (void)dropReceived:(NSArray *)filenames
{
    NSLog(@"Files dragged on: %@", filenames);
    for ( NSString *filename in filenames ) {
        NSLog(@"file: %@", filename);
        [self appendToList:filename];
    }
    
    [tableView reloadData];
    
    G9ImageRoper *roper = [[G9ImageRoper alloc] init];
    NSSize size = [roper calculateImageSize:images];
    NSLog(@"calc_size: width: %lf, height: %lf", size.width, size.height);
    
    [labelInform setStringValue:[[NSString alloc] initWithFormat:@"위의 %ld개의 이미지를 하나의 이미지로 합쳐 %.0lfpx*%.0lfpx 이미지로 만듭니다.", images.count, size.width, size.height]];
    
}

- (void)appendToList:(NSString *)path
{
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    
    BOOL isDir;
    if ( [fileManager fileExistsAtPath:path isDirectory:&isDir] && isDir ) {
        NSDirectoryEnumerator *dirEnum = [fileManager enumeratorAtPath:path];
        NSString *file;
        while ( file = [dirEnum nextObject]) {
            [self appendToList:[path stringByAppendingPathComponent:file]];
        }
    } else {
        NSString *ext = [path pathExtension];
        if ([ext isEqualToString:@"jpg"] || [ext isEqualToString:@"png"] || [ext isEqualToString:@"gif"]) {
            [images addObject:path];
        }
    }

}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return images.count;
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSString *path = [images objectAtIndex:row];
    if ( [[tableColumn identifier] isEqualToString:@"colNo"]) {
        return [[NSString alloc] initWithFormat:@"%ld.", row];
    } else {
        return path;
    }
}

- (IBAction)doClear:(id)sender {
    [images removeAllObjects];
    [tableView reloadData];
}

- (IBAction)doRope:(id)sender {
    if (images.count > 0) {
        G9ImageRoper *roper = [[G9ImageRoper alloc] init];
        
        NSString *desktop = [NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *saveTo = [desktop stringByAppendingPathComponent:[NSString stringWithFormat:@"%.f.jpg", [[NSDate date] timeIntervalSince1970]]];
        
        [roper ropeImage:images withHeightSpacing:10 forName:saveTo];
        [[NSWorkspace sharedWorkspace] selectFile:saveTo inFileViewerRootedAtPath:@""];
    }
}
@end
