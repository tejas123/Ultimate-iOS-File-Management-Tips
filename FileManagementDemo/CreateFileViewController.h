//
//  CreateFileViewController.h
//  FileManagementDemo
//
//  Created by TheAppGuruz-iOS-103 on 17/05/14.
//  Copyright (c) 2014 TheAppGuruz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateFileViewController : UIViewController<UIAlertViewDelegate>
- (IBAction)btnCreateFileTapped:(id)sender;
- (IBAction)btnCreateDirectoryTapped:(id)sender;
- (IBAction)btnWriteFileTapped:(id)sender;
- (IBAction)btnReadFileTapped:(id)sender;
- (IBAction)btnMoveFileTapped:(id)sender;
- (IBAction)btnCopyFileTapped:(id)sender;
- (IBAction)btnFilePermissionsTapped:(id)sender;
- (IBAction)btnFileEqualityCheckTapped:(id)sender;
- (IBAction)btnDirectoryContentTapped:(id)sender;
- (IBAction)btnRemoveFileTapped:(id)sender;

@end
